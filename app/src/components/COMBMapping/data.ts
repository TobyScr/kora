import { COMBCategory } from "./types";

export const SAMPLE_COMB_DATA: COMBCategory[] = [
  {
    id: "capability",
    label: "Capability",
    badge: "C",
    badgeColor: "teal",
    subtitle: "The knowledge or skills a person needs to perform the behaviour",
    isExpanded: true,
    barriers: [
      {
        id: "cap-1",
        name: "Online Spaces & Peer Dynamics",
        description:
          "Youth share and engage with outrage content impulsively, lacking reflection on manipulation tactics.",
        isRecommended: true,
        isSelected: false,
      },
      {
        id: "cap-2",
        name: 'Confusion over what constitutes "moral strength"',
        description:
          "Many equate moral conviction with confrontation, not restraint or community protection.",
        isRecommended: false,
        isSelected: false,
      },
      {
        id: "cap-3",
        name: "Lack of practical models for constructive online behavior",
        description:
          "Few examples show youth how to channel passion positively through social media.",
        isRecommended: false,
        isSelected: false,
      },
    ],
  },
  {
    id: "opportunity",
    label: "Opportunity",
    badge: "O",
    badgeColor: "orange",
    subtitle:
      "The social or physical conditions that make the behavior possible",
    isExpanded: true,
    barriers: [
      {
        id: "opp-1",
        name: "Absence of safe digital spaces for dialogue",
        description:
          "Fear of surveillance and stigma forces discussions into closed groups where extremist content circulates unchecked.",
        isRecommended: false,
        isSelected: false,
      },
      {
        id: "opp-2",
        name: "Weak access to positive, relatable mentors",
        description:
          "Offline and diaspora youth lack trusted figures who model alternative heroism.",
        isRecommended: true,
        isSelected: false,
      },
      {
        id: "opp-3",
        name: "Limited local partnerships amplifying credible non-state voices",
        description:
          "NGOs and educators lack digital reach or coordination.",
        isRecommended: false,
        isSelected: false,
      },
    ],
  },
  {
    id: "motivation",
    label: "Motivation",
    badge: "M",
    badgeColor: "purple",
    subtitle:
      "The thoughts and feelings that drive someone to act (or not act)",
    isExpanded: true,
    barriers: [
      {
        id: "mot-1",
        name: "Absence of safe digital spaces for dialogue",
        description:
          "Fear of surveillance and stigma forces discussions into closed groups where extremist content circulates unchecked.",
        isRecommended: false,
        isSelected: false,
      },
      {
        id: "mot-2",
        name: "Weak access to positive, relatable mentors",
        description:
          "Offline and diaspora youth lack trusted figures who model alternative heroism.",
        isRecommended: true,
        isSelected: false,
      },
      {
        id: "mot-3",
        name: "Limited local partnerships amplifying credible non-state voices",
        description:
          "NGOs and educators lack digital reach or coordination.",
        isRecommended: false,
        isSelected: false,
      },
    ],
  },
];
