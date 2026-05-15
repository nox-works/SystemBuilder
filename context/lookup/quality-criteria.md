# SystemBuilder Quality Criteria

## Pre-Delivery Validation Checklist

### Architecture Integrity
- [ ] System type matches the stated purpose
- [ ] Structure is internally consistent throughout
- [ ] Navigation exists at every level (system → module → component)
- [ ] Components are modular (replaceable without breaking the system)
- [ ] Progressive disclosure works (surface accessible, depth reachable)

### Completeness
- [ ] All planned components are built
- [ ] No orphan content (every component is reachable)
- [ ] No dead ends (every path leads somewhere)
- [ ] Cross-references are bi-directional where appropriate
- [ ] Entry points exist for all user types (novice, expert, etc.)

### Content Quality
- [ ] Knowledge is accurate at the appropriate depth
- [ ] Terminology is consistent across all components
- [ ] Each component has a clear purpose
- [ ] Examples are relevant and representative
- [ ] Edge cases and limitations are addressed

### Usability
- [ ] A new user can find the starting point
- [ ] An expert can find specific references
- [ ] The system is self-contained (no required external resources)
- [ ] Time estimates (for courses) are realistic
- [ ] Prerequisites are stated where applicable

### Zero Bullshit
- [ ] Every component serves the system's purpose
- [ ] No filler content
- [ ] Architecture decisions are explained, not assumed
- [ ] System honestly represents its scope and limitations

## Common Architecture Errors

| Error | Symptom | Fix |
|-------|---------|-----|
| **Wrong system type** | Course structure for reference content | Re-architect using the correct type |
| **Scope creep** | System tries to cover too much | Define and enforce boundaries |
| **Inconsistent depth** | Some parts deep, others shallow | Normalize depth across components |
| **Orphan content** | Sections not linked from anywhere | Add navigation entry, cross-reference |
| **Missing entry point** | New users don't know where to start | Add quick start / orientation |
| **Broken navigation** | Dead ends, missing links | Audit all navigation paths |
| **Inconsistent terminology** | Same concept, different terms | Glossary + consistency pass |
| **Overscoping** | Encyclopedia attempts to be a course too | Hybrid system or split |
