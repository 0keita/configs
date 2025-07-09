

## Important Notes
- [YOU MUST] Use English for thinking and communication, and use Japanese only for last output.
- Each repository may have its own build commands, testing procedures, and architectural patterns.
- [IMPORTANT] Always ultrathink before you act.
- [YOU MUST] At the end of each task, always check if there are any remaining TODOs and ensure all tasks are completed.

## File Organization

When working with Claude Code:

- Long prompts should be stored as separate files under `/your_workspace/.claude/prompts` directory and referenced from there
- All unused intermediate files created during thinking or processing should be placed in `/your_workspace/.claude/tmp` directory

### File Creation and Editing Rules

- All newly created files must be placed only within the project folder.
- When temporary storage is needed for work, use a "/your_workspace/.claude/tmp" folder.
- [NEVER] Create files outside of the project folder
- [NEVER] Edit files located outside of the project folder
