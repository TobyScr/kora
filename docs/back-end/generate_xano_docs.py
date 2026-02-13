#!/usr/bin/env python3
"""
Generate comprehensive Xano Stage 1: Understand database reference documentation
"""
import json
from collections import defaultdict

def format_validators(validators):
    """Format validators dict into readable string"""
    if not validators:
        return "None"
    parts = []
    for k, v in validators.items():
        parts.append(f"{k}={v}")
    return ", ".join(parts)

def document_table(table):
    """Generate markdown documentation for a single table"""
    doc = []
    doc.append(f"### {table['name']} (ID: {table['id']})")
    doc.append("")

    if table.get('description'):
        doc.append(f"**Description:** {table['description']}")
        doc.append("")

    if table.get('tag'):
        doc.append(f"**Tags:** {', '.join(table['tag'])}")
        doc.append("")

    doc.append("**Columns:**")
    doc.append("")

    for col in table['schema']:
        doc.append(f"#### `{col['name']}`")
        doc.append(f"- **Type:** {col['type']}")
        doc.append(f"- **Nullable:** {col['nullable']}")
        doc.append(f"- **Required:** {col['required']}")
        doc.append(f"- **Access:** {col['access']}")
        doc.append(f"- **Style:** {col['style']}")

        if col.get('default'):
            doc.append(f"- **Default:** `{col['default']}`")

        if col.get('format'):
            doc.append(f"- **Format:** {col['format']}")

        if col.get('validators'):
            doc.append(f"- **Validators:** {format_validators(col['validators'])}")

        if col.get('values'):
            doc.append(f"- **Enum Values:** {', '.join([f'`{v}`' for v in col['values']])}")

        if col.get('tableref_id'):
            doc.append(f"- **References Table ID:** {col['tableref_id']}")

        if col.get('description'):
            doc.append(f"- **Description:** {col['description']}")

        doc.append("")

    doc.append("---")
    doc.append("")
    return "\n".join(doc)

def document_api_group(api_group):
    """Generate markdown documentation for an API group"""
    doc = []
    doc.append(f"### {api_group['name']} (ID: {api_group['id']})")
    doc.append("")

    if api_group.get('description'):
        doc.append(f"**Description:** {api_group['description']}")
        doc.append("")

    endpoints = api_group.get('endpoints', [])
    if not endpoints:
        doc.append("*No endpoints documented*")
        doc.append("")
        return "\n".join(doc)

    doc.append(f"**Total Endpoints:** {len(endpoints)}")
    doc.append("")

    for endpoint in endpoints:
        method = endpoint.get('request_method', 'GET')
        path = endpoint.get('path', '/')
        name = endpoint.get('name', 'Unnamed')
        description = endpoint.get('description', '')

        doc.append(f"#### `{method} {path}`")
        if name != 'Unnamed':
            doc.append(f"**Name:** {name}")

        if description:
            doc.append(f"**Description:** {description}")

        # Add input details if available
        if endpoint.get('inputs'):
            doc.append("")
            doc.append("**Inputs:**")
            for inp in endpoint['inputs']:
                inp_name = inp.get('name', 'unnamed')
                inp_type = inp.get('type', 'unknown')
                inp_required = inp.get('required', False)
                inp_description = inp.get('description', '')
                required_str = " *(required)*" if inp_required else ""
                doc.append(f"- `{inp_name}` ({inp_type}){required_str}")
                if inp_description:
                    doc.append(f"  - {inp_description}")

        # Add response details if available
        if endpoint.get('response'):
            doc.append("")
            doc.append("**Response:** Defined")

        doc.append("")

    doc.append("---")
    doc.append("")
    return "\n".join(doc)

def build_relationship_map(tables):
    """Build a map of table relationships"""
    relationships = defaultdict(lambda: {'references': [], 'referenced_by': []})
    table_names = {t['id']: t['name'] for t in tables}

    for table in tables:
        table_id = table['id']
        table_name = table['name']

        for col in table['schema']:
            if col.get('tableref_id'):
                ref_id = col['tableref_id']
                ref_name = table_names.get(ref_id, f"Unknown({ref_id})")

                relationships[table_name]['references'].append({
                    'via': col['name'],
                    'to_table': ref_name,
                    'to_id': ref_id
                })

                relationships[ref_name]['referenced_by'].append({
                    'from_table': table_name,
                    'from_id': table_id,
                    'via': col['name']
                })

    return relationships

def main():
    # Load filtered data
    with open('xano_stage1_tables.json', 'r') as f:
        tables = json.load(f)

    with open('xano_stage1_apis.json', 'r') as f:
        api_groups = json.load(f)

    # Build relationship map
    relationships = build_relationship_map(tables)

    # Group tables by functional area
    table_groups = {
        'Core Entities': [279, 291, 292, 293],
        'Stage 1: Brief': [294, 303],
        'Stage 1: Research': [297, 304, 298, 309, 337, 344],
        'Stage 1: System Map': [338, 299, 300, 301],
        'Stage 1: Behavioural Objective': [340],
        'Stage 1: Assumption Testing': [341, 342],
        'Stage 1: COM-B & Personas': [347, 348, 306, 307, 308],
        'Step Tracking': [305, 302, 312]
    }

    tables_by_id = {t['id']: t for t in tables}

    # Start building the document
    doc = []
    doc.append("# Xano Stage 1: Understand - Database Reference")
    doc.append("")
    doc.append("**Generated:** 2026-02-13")
    doc.append("")
    doc.append("This document provides comprehensive reference for all Xano database tables and API endpoints")
    doc.append("used in Stage 1: Understand of the Kora intervention design workflow.")
    doc.append("")

    # Add summary statistics
    doc.append("## Summary")
    doc.append("")
    doc.append(f"- **Total Tables Documented:** {len(tables)}")
    doc.append(f"- **Total API Groups:** {len(api_groups)}")

    # Count total endpoints
    total_endpoints = sum(len(g.get('endpoints', [])) for g in api_groups)
    doc.append(f"- **Total API Endpoints:** {total_endpoints}")
    doc.append("")
    doc.append("**Tables by Category:**")
    for group_name, table_ids in table_groups.items():
        doc.append(f"- {group_name}: {len(table_ids)} tables")
    doc.append("")

    # Add quick reference table
    doc.append("## Quick Reference: Tables by Functional Area")
    doc.append("")
    doc.append("| Table Name | ID | Category | Purpose |")
    doc.append("|------------|----|-----------|---------| ")

    table_purposes = {
        279: "User authentication and profile",
        291: "Client organizations",
        292: "Projects within clients",
        293: "Individual interventions (central entity)",
        294: "Brief form data (structured)",
        303: "Brief chat output (AI-generated)",
        297: "Research content by section",
        304: "Research files and URLs",
        298: "Research section definitions",
        309: "Deep research prompts",
        337: "Research insights extracted",
        344: "Document-level insights",
        338: "System map visualization data",
        299: "Stakeholders in system map",
        300: "Stakeholder type definitions",
        301: "Role phrase templates for stakeholders",
        340: "Behavioural objectives (with selection)",
        341: "Assumptions to test",
        342: "Research questions for testing",
        347: "COM-B barriers analysis",
        348: "User personas",
        306: "Demographic data for personas",
        307: "Psychographic data for personas",
        308: "Context and media for personas",
        305: "Step completion tracking",
        302: "Workflow step definitions",
        312: "AI execution audit log"
    }

    for group_name, table_ids in table_groups.items():
        for table_id in table_ids:
            if table_id in tables_by_id:
                table = tables_by_id[table_id]
                purpose = table_purposes.get(table_id, "")
                doc.append(f"| {table['name']} | {table_id} | {group_name} | {purpose} |")

    doc.append("")

    # Add ERD diagram
    doc.append("## Entity Relationship Diagram")
    doc.append("")
    doc.append("```mermaid")
    doc.append("erDiagram")
    doc.append("    CLIENT ||--o{ PROJECT : \"owns\"")
    doc.append("    PROJECT ||--o{ INTERVENTION : \"contains\"")
    doc.append("    INTERVENTION ||--|| WORKFLOW_STEP : \"current_step\"")
    doc.append("    ")
    doc.append("    %% Stage 1: Brief")
    doc.append("    INTERVENTION ||--o| BRIEF_OUTPUT : \"has\"")
    doc.append("    INTERVENTION ||--o| BRIEF_CHAT_OUTPUT : \"has\"")
    doc.append("    ")
    doc.append("    %% Stage 1: Research")
    doc.append("    INTERVENTION ||--o{ RESEARCH : \"has\"")
    doc.append("    RESEARCH }o--|| RESEARCH_SECTIONS : \"section\"")
    doc.append("    RESEARCH }o--|| RESEARCH_Files_ : \"files\"")
    doc.append("    INTERVENTION ||--o{ RESEARCH_INSIGHTS : \"has\"")
    doc.append("    INTERVENTION ||--o{ DOCUMENT_INSIGHT : \"has\"")
    doc.append("    INTERVENTION ||--o{ RESEARCH_DEEPRESEARCH_PROMPTS : \"has\"")
    doc.append("    RESEARCH_Files_ }o--|| RESEARCH_SECTIONS : \"section\"")
    doc.append("    ")
    doc.append("    %% Stage 1: System Map")
    doc.append("    INTERVENTION ||--o{ SYSTEM_MAP : \"has\"")
    doc.append("    INTERVENTION ||--o{ STAKEHOLDERS : \"has\"")
    doc.append("    STAKEHOLDERS }o--|| OS_STAKEHOLDER_TYPES : \"type\"")
    doc.append("    OS_STAKEHOLDER_TYPES ||--o{ OS_STAKEHOLDER_ROLE_PHRASES : \"phrases\"")
    doc.append("    ")
    doc.append("    %% Stage 1: Behavioural Objective")
    doc.append("    INTERVENTION ||--o{ BEHAVIOURAL_OBJECTIVE_NEW : \"has\"")
    doc.append("    ")
    doc.append("    %% Stage 1: Assumption Testing")
    doc.append("    INTERVENTION ||--o{ ASSUMPTION : \"has\"")
    doc.append("    INTERVENTION ||--o{ RESEARCH_QUESTION : \"has\"")
    doc.append("    ")
    doc.append("    %% Stage 1: COM-B & Personas")
    doc.append("    INTERVENTION ||--o{ COM_B : \"has\"")
    doc.append("    INTERVENTION ||--o{ PERSONA : \"has\"")
    doc.append("    PERSONA }o--|| DEMOGRAPHICS : \"demographics\"")
    doc.append("    PERSONA }o--|| PSYCHOGRAPHICS : \"psychographics\"")
    doc.append("    PERSONA }o--|| CONTEXT_MEDIA : \"context_media\"")
    doc.append("    ")
    doc.append("    %% Step Tracking")
    doc.append("    INTERVENTION ||--o{ STEP_CONFIRMATION_LOG : \"has\"")
    doc.append("    STEP_CONFIRMATION_LOG ||--o{ ai_execution_log : \"has\"")
    doc.append("```")
    doc.append("")

    doc.append("## Table of Contents")
    doc.append("")
    doc.append("1. [Core Entities](#core-entities)")
    doc.append("2. [Stage 1: Brief](#stage-1-brief)")
    doc.append("3. [Stage 1: Research](#stage-1-research)")
    doc.append("4. [Stage 1: System Map](#stage-1-system-map)")
    doc.append("5. [Stage 1: Behavioural Objective](#stage-1-behavioural-objective)")
    doc.append("6. [Stage 1: Assumption Testing](#stage-1-assumption-testing)")
    doc.append("7. [Stage 1: COM-B & Personas](#stage-1-com-b--personas)")
    doc.append("8. [Step Tracking](#step-tracking)")
    doc.append("9. [API Endpoints](#api-endpoints)")
    doc.append("10. [Entity Relationships](#entity-relationships)")
    doc.append("11. [Front-End Mapping](#front-end-mapping)")
    doc.append("12. [Questions & Flags](#questions--flags)")
    doc.append("")
    doc.append("---")
    doc.append("")

    # Document each group
    for group_name, table_ids in table_groups.items():
        doc.append(f"## {group_name}")
        doc.append("")

        for table_id in table_ids:
            if table_id in tables_by_id:
                doc.append(document_table(tables_by_id[table_id]))

        doc.append("")

    # Document API endpoints
    doc.append("## API Endpoints")
    doc.append("")
    doc.append("API endpoints are organized by functional area matching the Stage 1 workflow.")
    doc.append("")

    api_groups_sorted = sorted(api_groups, key=lambda x: x['name'])
    for api_group in api_groups_sorted:
        doc.append(document_api_group(api_group))

    # Document relationships
    doc.append("## Entity Relationships")
    doc.append("")
    doc.append("This section shows how tables reference each other through foreign keys.")
    doc.append("")

    for table_name in sorted(relationships.keys()):
        rels = relationships[table_name]

        if rels['references'] or rels['referenced_by']:
            doc.append(f"### {table_name}")
            doc.append("")

            if rels['references']:
                doc.append("**References (outgoing):**")
                for ref in rels['references']:
                    doc.append(f"- Via `{ref['via']}` → {ref['to_table']} (ID: {ref['to_id']})")
                doc.append("")

            if rels['referenced_by']:
                doc.append("**Referenced by (incoming):**")
                for ref in rels['referenced_by']:
                    doc.append(f"- {ref['from_table']} (ID: {ref['from_id']}) via `{ref['via']}`")
                doc.append("")

    # Front-end mapping
    doc.append("## Front-End Mapping")
    doc.append("")
    doc.append("This section maps each implemented front-end section to the Xano tables and API endpoints it uses.")
    doc.append("")

    frontend_sections = {
        "Brief Overview": {
            "tables": ["INTERVENTION", "BRIEF_OUTPUT", "BRIEF_CHAT_OUTPUT"],
            "api_groups": ["Brief", "Intervention"]
        },
        "Research Insights": {
            "tables": ["INTERVENTION", "RESEARCH", "RESEARCH_SECTIONS", "RESEARCH_Files_", "RESEARCH_INSIGHTS", "DOCUMENT_INSIGHT", "RESEARCH_DEEPRESEARCH_PROMPTS"],
            "api_groups": ["Research", "Intervention", "AI Block Generation", "n8n"]
        },
        "System Map": {
            "tables": ["INTERVENTION", "SYSTEM_MAP", "STAKEHOLDERS", "OS_STAKEHOLDER_TYPES", "OS_STAKEHOLDER_ROLE_PHRASES"],
            "api_groups": ["System Map", "Intervention", "AI Block Generation"]
        },
        "Behavioural Objective": {
            "tables": ["INTERVENTION", "BEHAVIOURAL_OBJECTIVE_NEW"],
            "api_groups": ["Behavioural Objective", "Intervention", "AI Block Generation"]
        },
        "Assumption Testing": {
            "tables": ["INTERVENTION", "ASSUMPTION", "RESEARCH_QUESTION"],
            "api_groups": ["Assumption Testing", "Intervention", "AI Block Generation"]
        }
    }

    for section_name, mapping in frontend_sections.items():
        doc.append(f"### {section_name}")
        doc.append("")
        doc.append("**Tables:**")
        for table in mapping['tables']:
            doc.append(f"- {table}")
        doc.append("")
        doc.append("**API Groups:**")
        for api in mapping['api_groups']:
            doc.append(f"- {api}")
        doc.append("")

    # Questions and flags
    doc.append("## Questions & Flags")
    doc.append("")
    doc.append("### Identified Issues")
    doc.append("")
    doc.append("1. **BRIEF_OUTPUT vs BRIEF_CHAT_OUTPUT**")
    doc.append("   - Two tables for brief data with different schemas")
    doc.append("   - BRIEF_OUTPUT has enum budget_currency (¥, €, $, £)")
    doc.append("   - BRIEF_CHAT_OUTPUT has text budget_currency")
    doc.append("   - Which one is the source of truth?")
    doc.append("")
    doc.append("2. **Missing table IDs**")
    doc.append("   - Some tableref_id values may point to tables outside Stage 1")
    doc.append("   - Need to verify all foreign key relationships are valid")
    doc.append("")
    doc.append("3. **RESEARCH_Files_ naming**")
    doc.append("   - Unusual table name with trailing underscore")
    doc.append("   - Is this intentional or a legacy artifact?")
    doc.append("")
    doc.append("4. **Step tracking overlap**")
    doc.append("   - Both STEP_CONFIRMATION_LOG and WORKFLOW_STEP exist")
    doc.append("   - ai_execution_log references STEP_CONFIRMATION_LOG")
    doc.append("   - Need clarification on the relationship between these three tables")
    doc.append("")
    doc.append("5. **Access levels**")
    doc.append("   - Some critical fields (like is_confirmed, is_selected) are marked private")
    doc.append("   - Need to verify if this affects front-end data access")
    doc.append("")
    doc.append("6. **Missing enum documentation**")
    doc.append("   - Some enum fields may have undocumented valid values")
    doc.append("   - Consider adding descriptions for each enum value's meaning")
    doc.append("")

    # Write the final document
    output_path = 'xano_understand_stage_reference.md'
    with open(output_path, 'w') as f:
        f.write('\n'.join(doc))

    print(f"Documentation generated: {output_path}")
    print(f"Total tables documented: {len(tables)}")
    print(f"Total API groups documented: {len(api_groups)}")

if __name__ == '__main__':
    main()
