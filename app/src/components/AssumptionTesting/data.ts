import type { Assumption, AssumptionColor, ResearchQuestion } from "./types";

export const COLORS: AssumptionColor[] = [
  "teal", "cyan", "blue", "indigo", "violet", "amber", "rose", "emerald",
];

export function getColorForIndex(index: number): AssumptionColor {
  return COLORS[index % COLORS.length];
}

export const SAMPLE_ASSUMPTIONS: Assumption[] = [
  {
    id: "1",
    number: 1,
    title: "We assume that young men aged 16-25 do not critically evaluate online content because they lack the skills to distinguish genuine information from propaganda",
    color: "teal",
  },
  {
    id: "2",
    number: 2,
    title: "We assume that socially isolated young men seek belonging in manosphere communities because they lack access to constructive offline social groups",
    color: "cyan",
  },
  {
    id: "3",
    number: 3,
    title: "We assume that young men who share misogynistic content do so because algorithmic amplification normalises it within their social feeds",
    color: "blue",
  },
  {
    id: "4",
    number: 4,
    title: "We assume that economically anxious young men are more susceptible to radicalisation because extremist groups offer material support and purpose",
    color: "indigo",
  },
  {
    id: "5",
    number: 5,
    title: "We assume that bystanders in online gaming spaces do not report harmful recruitment content because they fear social repercussions from their peer group",
    color: "violet",
  },
  {
    id: "6",
    number: 6,
    title: "We assume that current counter-narrative campaigns fail to compete with manosphere content because they lack emotional resonance and production quality",
    color: "amber",
  },
];

export const AI_ASSUMPTIONS = [
  "We assume that young men who engage with manosphere influencers on TikTok do not recognise the content as radicalising because it is packaged as self-improvement advice",
  "We assume that parents and educators do not intervene in early-stage radicalisation because they lack awareness of the digital spaces where recruitment occurs",
  "We assume that peer reporting tools on mainstream platforms are underused by young people because the reporting process feels ineffective and opaque",
];

export const SAMPLE_RESEARCH_QUESTIONS: ResearchQuestion[] = [
  {
    id: "rq-1",
    number: 1,
    text: "What proportion of young men aged 16-25 can accurately identify manipulative content techniques used by manosphere influencers?",
  },
  {
    id: "rq-2",
    number: 2,
    text: "How does social isolation correlate with frequency of engagement in manosphere communities among the target demographic?",
  },
  {
    id: "rq-3",
    number: 3,
    text: "To what extent does algorithmic amplification increase the normalisation of misogynistic content sharing within peer networks?",
  },
  {
    id: "rq-4",
    number: 4,
    text: "What role does economic anxiety play as a gateway to radicalisation compared to other vulnerability factors?",
  },
  {
    id: "rq-5",
    number: 5,
    text: "What barriers prevent bystanders from reporting harmful recruitment content in online gaming and social media spaces?",
  },
  {
    id: "rq-6",
    number: 6,
    text: "How do existing counter-narrative campaigns compare to manosphere content in terms of emotional engagement and production quality?",
  },
  {
    id: "rq-7",
    number: 7,
    text: "What digital literacy interventions have proven most effective at building resilience against algorithmic manipulation among vulnerable youth?",
  },
];

export const AI_RESEARCH_QUESTIONS = [
  "How do cross-platform recruitment funnels operate, and at which stage is intervention most effective at disrupting the radicalisation pipeline?",
  "What characteristics distinguish young men who disengage from manosphere communities from those who become more deeply embedded?",
  "How effective are peer-led interventions compared to institutional programmes in shifting attitudes among young men exposed to misogynistic content?",
];
