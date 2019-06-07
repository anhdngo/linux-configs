# windows-configs
Config files and essential programs for my development workflow on windows

## autohotkey
### Current Bindings
- Ctrl+Alt+B - Open Browser of Choice
- Ctrl+Alt+E - Open Explorer to home directory
- Ctrl+Alt+P - Open Powershell Terminal to home directory
- Ctrl+Alt+T - Open Ubuntu Subsystem Terminal

### Run On Startup
To run an autohotkey script on startup (from [autohotkey FAQs](https://autohotkey.com/docs/FAQ.htm)):
1. Find the script file, select it, and press Control+C.
2. Press Win+R to open the Run dialog, then enter shell:startup and click OK or Enter. This will open the Startup folder for the current user. To instead open the folder for all users, enter shell:common startup (however, in that case you must be an administrator to proceed).
3. Right click inside the window, and click "Paste Shortcut". The shortcut to the script should now be in the Startup folder.