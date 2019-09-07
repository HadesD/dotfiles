bcdedit /enum
bcdedit /copy "{current}" /d "Hyper V"
bcdedit /set "{current}" hypervisorlaunchtype off