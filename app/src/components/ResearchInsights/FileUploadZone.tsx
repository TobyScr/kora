"use client";

import { useRef, useState, type DragEvent } from "react";
import type { ResearchFile } from "./types";

type FileUploadZoneProps = {
  files: ResearchFile[];
  onFilesChange: (files: ResearchFile[]) => void;
  accept?: string;
  maxSize?: string;
};

const UploadIcon = () => (
  <svg width="24" height="24" viewBox="0 0 24 24" fill="none">
    <path
      d="M12 16V8m0 0l-3 3m3-3l3 3"
      stroke="#64748b"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
    <path
      d="M20 16.5V18a2 2 0 01-2 2H6a2 2 0 01-2-2v-1.5"
      stroke="#64748b"
      strokeWidth="1.5"
      strokeLinecap="round"
    />
  </svg>
);

const FileIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path
      d="M4 1.5h5.5L13 5v9a1.5 1.5 0 01-1.5 1.5h-7A1.5 1.5 0 013 14V3A1.5 1.5 0 014.5 1.5z"
      stroke="#64748b"
      strokeWidth="1.2"
    />
    <path d="M9.5 1.5V5H13" stroke="#64748b" strokeWidth="1.2" />
  </svg>
);

const CheckIcon = () => (
  <svg width="14" height="14" viewBox="0 0 14 14" fill="none">
    <circle cx="7" cy="7" r="7" fill="#22c55e" />
    <path
      d="M4 7l2 2 4-4"
      stroke="white"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
  </svg>
);

const TrashIcon = () => (
  <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <path
      d="M3 4h10M6 4V3a1 1 0 011-1h2a1 1 0 011 1v1m2 0v9a1 1 0 01-1 1H5a1 1 0 01-1-1V4h8z"
      stroke="currentColor"
      strokeWidth="1.2"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
  </svg>
);

export function FileUploadZone({
  files,
  onFilesChange,
  accept = ".pdf,.doc,.docx",
  maxSize = "100MB",
}: FileUploadZoneProps) {
  const [isDragOver, setIsDragOver] = useState(false);
  const inputRef = useRef<HTMLInputElement>(null);

  const handleDragOver = (e: DragEvent) => {
    e.preventDefault();
    setIsDragOver(true);
  };

  const handleDragLeave = (e: DragEvent) => {
    e.preventDefault();
    setIsDragOver(false);
  };

  const handleDrop = (e: DragEvent) => {
    e.preventDefault();
    setIsDragOver(false);
    const droppedFiles = Array.from(e.dataTransfer.files);
    handleFiles(droppedFiles);
  };

  const handleFileSelect = (e: React.ChangeEvent<HTMLInputElement>) => {
    if (e.target.files) {
      const selectedFiles = Array.from(e.target.files);
      handleFiles(selectedFiles);
    }
  };

  const handleFiles = (newFiles: File[]) => {
    const processedFiles: ResearchFile[] = newFiles.map((file) => ({
      id: `file-${Date.now()}-${Math.random().toString(36).substr(2, 9)}`,
      name: file.name,
      size: formatFileSize(file.size),
      type: getFileType(file.name),
    }));
    onFilesChange([...files, ...processedFiles]);
  };

  const formatFileSize = (bytes: number): string => {
    if (bytes < 1024) return `${bytes}B`;
    if (bytes < 1024 * 1024) return `${Math.round(bytes / 1024)}KB`;
    return `${Math.round(bytes / (1024 * 1024))}MB`;
  };

  const getFileType = (filename: string): "pdf" | "doc" | "docx" => {
    const ext = filename.split(".").pop()?.toLowerCase();
    if (ext === "pdf") return "pdf";
    if (ext === "docx") return "docx";
    return "doc";
  };

  const removeFile = (fileId: string) => {
    onFilesChange(files.filter((f) => f.id !== fileId));
  };

  return (
    <div className="space-y-3">
      {/* Drop zone */}
      <div
        onDragOver={handleDragOver}
        onDragLeave={handleDragLeave}
        onDrop={handleDrop}
        onClick={() => inputRef.current?.click()}
        className={`flex flex-col items-center justify-center gap-2 py-8 border-2 border-dashed rounded-lg cursor-pointer transition-colors ${
          isDragOver
            ? "border-button-solid bg-blue-50"
            : "border-stroke-default hover:border-stroke-soft"
        }`}
      >
        <UploadIcon />
        <p className="text-sm text-text-secondary">
          Drag your file(s) or{" "}
          <span className="text-[#0ea5e9] font-medium">Browse Files</span>
        </p>
        <p className="text-xs text-text-tertiary">
          PDF, DOC, DOCX (max {maxSize})
        </p>
        <input
          ref={inputRef}
          type="file"
          accept={accept}
          multiple
          onChange={handleFileSelect}
          className="hidden"
        />
      </div>

      {/* Uploaded files list */}
      {files.length > 0 && (
        <div className="space-y-2">
          <p className="text-xs text-text-secondary font-medium">Attachments</p>
          {files.map((file) => (
            <div
              key={file.id}
              className="flex items-center gap-3 px-3 py-2 bg-[#f8fafc] rounded-lg border border-stroke-default"
            >
              <FileIcon />
              <span className="flex-1 text-sm text-text-primary truncate">
                {file.name}
              </span>
              <CheckIcon />
              <span className="text-xs text-text-tertiary">{file.size}</span>
              <button
                onClick={() => removeFile(file.id)}
                className="text-text-tertiary hover:text-text-primary transition-colors"
              >
                <TrashIcon />
              </button>
            </div>
          ))}
        </div>
      )}
    </div>
  );
}
