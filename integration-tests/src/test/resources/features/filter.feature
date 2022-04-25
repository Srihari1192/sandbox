Feature: Filter tests

  Background:
    Given authenticate against Manager
    And create a new Bridge "mybridge"
    And the Bridge "mybridge" is existing with status "ready" within 4 minutes
    And the Ingress of Bridge "mybridge" is available within 2 minutes
    And add a Processor to the Bridge "mybridge" with body:
    """
    {
      "name": "myProcessor",
      "action": {
        "type": "Webhook",
        "parameters": {
            "endpoint": "https://webhook.site/${env.webhook.site.uuid}"
        }
      },
      "filters": [
      {
        "key": "source",
        "type": "StringEquals",
        "value": "StorageService"
       }
      ],
      "transformationTemplate" : "{\"text\": \"hello {data.name} by {id}\"}"
    }
    """
    And the Processor "myProcessor" of the Bridge "mybridge" is existing with status "ready" within 3 minutes

  Scenario: Messages are sent to Processor with matching filter

    When send a cloud event to the Ingress of the Bridge "mybridge":
    """
    {
      "specversion": "1.0",
      "type": "webhook.site.invoked",
      "source": "StorageService",
      "id": "filter-test",
      "data": {
          "name": "world"
        }
    }
    """
    Then Webhook site contains request with text "hello world by ${bridge.mybridge.cloud-event.filter-test.id}" within 1 minute

