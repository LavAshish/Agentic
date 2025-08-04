# Cortex Integration Guide

This guide walks you through integrating your deployed MCP tool server with the Cortex platform.

## Prerequisites

Before starting, ensure that:
- Your MCP server has been successfully deployed to CATS

## Step 1: Access Cortex API Documentation

Navigate to the Cortex API documentation:
🔗 **[https://cortex.lilly.com/docs/](https://cortex.lilly.com/docs/)**

## Step 2: Create Toolkit Configuration

The toolkit configuration creates the connection between your deployed MCP tool server and the Cortex platform.

### 2.1 Navigate to Toolkit Collection

1. In the Cortex API documentation, locate the **Toolkit collection**
2. Find the **`PUT /toolkits`** endpoint

### 2.2 Configure Your Toolkit

Use the `PUT /toolkits` endpoint to register your MCP server with Cortex. This configuration tells Cortex:
- Where your tool server is hosted
- What tools are available
- How to authenticate and communicate with your server

### 2.3 Reference Configuration

Check the `sample-cortex-configs/toolkit_config.json` for reference configurations. The most important fields to fill is the `server` field, which should point to your MCP server URL. This should be of the format:
```
"mcp://<your-service-name>.<namespace>.svc.cluster.local:5000"
```

## Step 3: Test Your Toolkit

Once you've configured your toolkit using the `PUT /toolkits` endpoint, you can test it using the following endpoints in the same Toolkit collection:

### 3.1 Describe Your Toolkit
Use the **`/describe`** endpoint to verify that your toolkit has been properly registered and to see what tools are available:
- This endpoint will return the toolkit configuration and list all available tools
- Check that the server connection is working

### 3.2 Execute Tools
Use the **`/execute`** endpoint to test individual tools:
- Validate that responses are returned correctly from your MCP server

