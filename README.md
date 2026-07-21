# Backend OS Release

This release stores `gpt_agent.exe` as split parts so every Git object stays below 25 MB.

## Rebuild `gpt_agent.exe`

1. Download all files in this folder.
2. Double-click `merge.bat`.
3. The script rebuilds `gpt_agent.exe` and verifies SHA256 against `manifest.json`.

Equivalent PowerShell command:

```powershell
powershell -ExecutionPolicy Bypass -File .\join_gpt_agent.ps1
```

## Included Files

- `gpt_agent.exe.part001`
- `gpt_agent.exe.part002`
- `manifest.json`
- `join_gpt_agent.bat`
- `join_gpt_agent.ps1`
- `merge.bat` and `merge.ps1` compatibility wrappers
- `get_hdid.exe`

## SHA256

Expected `gpt_agent.exe` SHA256:

```text
32A10A4CCAE407F6328B23714A854084373ACE2C04DA1EAC158A566D02DA8BF3
```

## License

Run `get_hdid.exe`, send the HDID to receive `license.json`, then place `license.json` next to `gpt_agent.exe`.
