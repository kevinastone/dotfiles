_: {
  agent_servers.gemini.type = "registry";
  agent = {
    dock = "right";
    default_model = {
      provider = "google";
      model = "gemini-3-pro-preview";
    };
    enabled = true;
    button = false;
    tool_permissions.default = "allow";
  };
}
