# Hum

Humane micro-service registry.

## What's this for then?

Modern architectures are headed away from a handful of large systems and towards having many more applications and services with complex interactions.  Hum is intended to allow services to register themselves and maintain a live service map with autoritative information from running systems, instead of hand-crafted and out-of-date documentation.

The concept comes from [this article](http://martinfowler.com/bliki/HumaneRegistry.html).

## Hum API Sketches

### `GET /components`

Returns a representation of the collection of components.

``` json
{
  "_embedded": {
    "components": [
      {
        "id": "wigwam-generator",
        "label": "Wigwam Generator",
        "class": "svc",
        "_links": {
            "self": { "href": "http://hum/components/wigwam-generator" }
        }
      },
      {
        "id": "customer-price-notifier",
        "label": "Customer Price Notifier",
        "class": "svc ui",
        "_links": {
            "self": { "href": "http://hum/components/customer-price-notifier" }
        }
      },
      ...
    ]
  },
  "_links": {
    "self": {"href": "http://hum/components"}
  }
}
```

### `GET /components/customer-price-notifier`

Returns a representation of a single component.

``` json
{
  "id": "customer-price-notifier",
  "label": "Notifies customers of price changes",
  "class": "app",
  "hostname": "customer-price-notifier.domain",
  "vcs": "git:org/customer-price-notifier",
  "custodians": [ "git:evanb", "git:the_stig" ],
  "description": "Customer price notifier service notifies customers of changes in price. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
  "depends-on": {
    "wigwam-generator": {
      "label": "Wigwam Generator",
      "description": "Feed of generated wigwams",
      "direction": "pull"
    },
    ...
  },
  "authority": {
    "summary": "amber",
    "live": ["label", "vcs", "custodians", "description"],
    "static": ["depends-on"]
  },
  "_links": {
    "self": {"href": "http://hum/components/customer-price-notifier"}
  }
}
```

