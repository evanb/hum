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
        "label": "Generator of Wigwams",
        "class": "app",
        "_links": {
            "self": { "href": "http://hum/components/wigwam-generator" }
        }
      },
      {
        "id": "customer-price-notifier",
        "label": "Notifies customers of price changes",
        "class": "app",
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
  "id": "wigwam-generator",
  "label": "Generator of Wigwams",
  "class": "app",
  "_links": {
    "self": {"href": "http://hum/components/customer-price-notifier"}
  }
}
```

