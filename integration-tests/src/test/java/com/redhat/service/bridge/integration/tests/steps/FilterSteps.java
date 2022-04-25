package com.redhat.service.bridge.integration.tests.steps;


import java.time.Duration;

import com.redhat.service.bridge.integration.tests.context.TestContext;
import com.redhat.service.bridge.integration.tests.context.resolver.ContextResolver;

import com.redhat.service.bridge.integration.tests.resources.webhook.site.WebhookSiteResource;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

import org.assertj.core.api.Assertions;
import org.awaitility.Awaitility;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;


public class FilterSteps {
    private TestContext context;
    private final String KEY = "source";
    private final String VALUE = "StorageService";

    public FilterSteps(TestContext context) {
        this.context = context;
    }


}


