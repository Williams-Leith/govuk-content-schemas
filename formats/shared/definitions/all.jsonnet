(import "routes_redirects.jsonnet") + {
  frontend_links: (import "frontend_links.jsonnet"),
  frontend_links_with_base_path: (import "frontend_links_with_base_path.jsonnet"),
  absolute_path: {
    type: "string",
    pattern: "^/(([a-zA-Z0-9._~!$&'()*+,;=:@-]|%[0-9a-fA-F]{2})+(/([a-zA-Z0-9._~!$&'()*+,;=:@-]|%[0-9a-fA-F]{2})*)*)?$",
    description: "A path only. Query string and/or fragment are not allowed.",
  },
  absolute_fullpath: {
    type: "string",
    pattern: "^/(([a-zA-Z0-9._~!$&'()*+,;=:@-]|%[0-9a-fA-F]{2})+(/([a-zA-Z0-9._~!$&'()*+,;=:@-]|%[0-9a-fA-F]{2})*)*)?(\\?([a-zA-Z0-9._~!$&'()*+,;=:@-]|%[0-9a-fA-F]{2})*)?(#([a-zA-Z0-9._~!$&'()*+,;=:@-]|%[0-9a-fA-F]{2})*)?$",
    description: "A path with optional query string and/or fragment.",
  },
  govuk_request_id: {
    type: [
      "string",
      "null"
    ]
  },
  govuk_subdomain_url: {
    type: "string",
    pattern: "^https://([a-zA-Z0-9]([a-zA-Z0-9-]{0,61}[A-Za-z0-9])?\\.)*gov\\.uk(/(([a-zA-Z0-9._~!$&'()*+,;=:@-]|%[0-9a-fA-F]{2})+(/([a-zA-Z0-9._~!$&'()*+,;=:@-]|%[0-9a-fA-F]{2})*)*)?(\\?([a-zA-Z0-9._~!$&'()*+,;=:@-]|%[0-9a-fA-F]{2})*)?(#([a-zA-Z0-9._~!$&'()*+,;=:@-]|%[0-9a-fA-F]{2})*)?)?$",
    description: "A URL under the gov.uk domain with optional query string and/or fragment.",
  },
  access_limited: {
    type: "object",
    additionalProperties: false,
    properties: {
      users: {
        type: "array",
        items: {
          type: "string",
        },
      },
      auth_bypass_ids: {
        "$ref": "#/definitions/guid_list",
        description: "A list of ids that will allow access to this item for non-authenticated users",
      },
    },
  },
  analytics_identifier: {
    anyOf: [
      {
        type: "string",
      },
      {
        type: "null",
      },
    ],
    description: "A short identifier we send to Google Analytics for multi-valued fields. This means we avoid the truncated values we would get if we sent the path or slug of eg organisations.",
  },
  absolute_path_optional: {
    anyOf: [
      {
        "$ref": "#/definitions/absolute_path",
      },
      {
        type: "null",
      },
    ],
  },
  description: {
    type: "string",
  },
  description_optional: {
    anyOf: [
      {
        "$ref": "#/definitions/description",
      },
      {
        type: "null",
      },
    ],
  },
  details: {
    type: "object",
    additionalProperties: false,
    properties: {},
  },
  document_type: {
    type: "string",
    enum: [
      "aaib_report",
      "about",
      "about_our_services",
      "access_and_opening",
      "announcement",
      "answer",
      "asylum_support_decision",
      "authored_article",
      "business_finance_support_scheme",
      "business_support",
      "business_support_finder",
      "calculator",
      "calendar",
      "campaign",
      "case_study",
      "closed_consultation",
      "cma_case",
      "coming_soon",
      "complaints_procedure",
      "completed_transaction",
      "consultation",
      "consultation_outcome",
      "contact",
      "corporate_report",
      "correspondence",
      "countryside_stewardship_grant",
      "decision",
      "detailed_guidance",
      "detailed_guide",
      "dfid_research_output",
      "document_collection",
      "drug_safety_update",
      "email_alert_signup",
      "employment_appeal_tribunal_decision",
      "employment_tribunal_decision",
      "equality_and_diversity",
      "esi_fund",
      "fatality_notice",
      "field_of_operation",
      "financial_release",
      "financial_releases_campaign",
      "financial_releases_geoblocker",
      "financial_releases_index",
      "financial_releases_success",
      "finder",
      "finder_email_signup",
      "foi_release",
      "form",
      "generic_with_external_related_links",
      "gone",
      "government_response",
      "guidance",
      "guide",
      "help_page",
      "hmrc_manual",
      "hmrc_manual_section",
      "homepage",
      "html_publication",
      "impact_assessment",
      "independent_report",
      "international_development_fund",
      "international_treaty",
      "licence",
      "license_finder",
      "local_transaction",
      "maib_report",
      "mainstream_browse_page",
      "manual",
      "manual_section",
      "map",
      "media_enquiries",
      "medical_safety_alert",
      "membership",
      "ministerial_role",
      "national",
      "national_statistics",
      "national_statistics_announcement",
      "need",
      "news_article",
      "news_story",
      "notice",
      "official",
      "official_statistics",
      "official_statistics_announcement",
      "open_consultation",
      "oral_statement",
      "organisation",
      "our_energy_use",
      "our_governance",
      "person",
      "personal_information_charter",
      "petitions_and_campaigns",
      "place",
      "placeholder",
      "placeholder_ministerial_role",
      "placeholder_organisation",
      "placeholder_person",
      "placeholder_policy",
      "placeholder_policy_area",
      "placeholder_topical_event",
      "placeholder_working_group",
      "placeholder_world_location",
      "placeholder_world_location_news_page",
      "placeholder_worldwide_organisation",
      "policy",
      "policy_area",
      "policy_paper",
      "press_release",
      "procurement",
      "programme",
      "promotional",
      "publication_scheme",
      "raib_report",
      "recruitment",
      "redirect",
      "regulation",
      "research",
      "search",
      "service_manual_guide",
      "service_manual_homepage",
      "service_manual_service_standard",
      "service_manual_service_toolkit",
      "service_manual_topic",
      "service_standard_report",
      "services_and_information",
      "simple_smart_answer",
      "smart_answer",
      "social_media_use",
      "special_route",
      "specialist_document",
      "speech",
      "staff_update",
      "statistical_data_set",
      "statistics",
      "statistics_announcement",
      "statutory_guidance",
      "take_part",
      "tax_tribunal_decision",
      "taxon",
      "terms_of_reference",
      "topic",
      "topical_event",
      "topical_event_about_page",
      "transaction",
      "transparency",
      "travel_advice",
      "travel_advice_index",
      "unpublishing",
      "utaac_decision",
      "vehicle_recalls_and_faults_alert",
      "video",
      "welsh_language_scheme",
      "working_group",
      "world_location",
      "world_location_news_article",
      "world_news_story",
      "worldwide_organisation",
      "written_statement",
    ],
  },
  external_related_links: {
    type: "array",
    items: {
      "$ref": "#/definitions/external_link",
    },
  },
  external_link: {
    type: "object",
    additionalProperties: false,
    required: [
      "title",
      "url",
    ],
    properties: {
      title: {
        type: "string",
      },
      url: {
        type: "string",
        format: "uri",
      },
    },
  },
  internal_link_without_guid: {
    description: "Links to pages on GOV.UK without a corresponding GUID. eg A filtered list of publications",
    type: "object",
    additionalProperties: false,
    required: [
      "title",
      "path",
    ],
    properties: {
      title: {
        type: "string",
      },
      path: {
        "$ref": "#/definitions/absolute_fullpath",
      },
    },
  },
  internal_or_external_link: {
    anyOf: [
      {
        "$ref": "#/definitions/external_link",
      },
      {
        "$ref": "#/definitions/internal_link_without_guid",
      },
      {
        "$ref": "#/definitions/guid",
      },
    ],
  },
  government: {
    type: "object",
    additionalProperties: false,
    required: [
      "title",
      "slug",
      "current",
    ],
    properties: {
      title: {
        type: "string",
        description: "Name of the government that first published this document, eg '1970 to 1974 Conservative government'.",
      },
      slug: {
        type: "string",
        description: "Government slug, used for analytics, eg '1970-to-1974-conservative-government'.",
      },
      current: {
        type: "boolean",
        description: "Is the government that published this document still the current government.",
      },
    },
  },
  guid: {
    type: "string",
    pattern: "^[a-f0-9]{8}-[a-f0-9]{4}-[1-5][a-f0-9]{3}-[89ab][a-f0-9]{3}-[a-f0-9]{12}$",
  },
  guid_list: {
    type: "array",
    uniqueItems: true,
    items: {
      "$ref": "#/definitions/guid",
    },
  },
  publishing_app_name: {
    description: "The application that published this item.",
    type: "string",
    enum: [
      "calculators",
      "calendars",
      "collections-publisher",
      "contacts",
      "content-tagger",
      "design-principles",
      "external-link-tracker",
      "feedback",
      "frontend",
      "hmrc-manuals-api",
      "info-frontend",
      "licencefinder",
      "manuals-frontend",
      "manuals-publisher",
      "maslow",
      "performanceplatform-big-screen-view",
      "policy-publisher",
      "publisher",
      "rummager",
      "service-manual-publisher",
      "share-sale-publisher",
      "short-url-manager",
      "smartanswers",
      "specialist-publisher",
      "spotlight",
      "static",
      "tariff",
      "travel-advice-publisher",
      "whitehall",
    ],
  },
  rendering_app: {
    description: "The application that renders this item.",
    type: "string",
    enum: [
      "calculators",
      "calendars",
      "collections",
      "designprinciples",
      "email-alert-frontend",
      "email-campaign-frontend",
      "feedback",
      "finder-frontend",
      "frontend",
      "government-frontend",
      "info-frontend",
      "licencefinder",
      "manuals-frontend",
      "performanceplatform-big-screen-view",
      "publicapi",
      "rummager",
      "service-manual-frontend",
      "smartanswers",
      "spotlight",
      "static",
      "tariff",
      "whitehall-admin",
      "whitehall-frontend",
    ],
  },
  rendering_app_optional: {
    anyOf: [
      {
        "$ref": "#/definitions/rendering_app",
      },
      {
        type: "null",
      },
    ],
  },
  image: {
    type: "object",
    additionalProperties: false,
    required: [
      "url",
    ],
    properties: {
      url: {
        type: "string",
        format: "uri",
      },
      alt_text: {
        type: "string",
      },
      caption: {
        anyOf: [
          {
            type: "string",
          },
          {
            type: "null",
          },
        ],
      },
    },
  },
  update_type: {
    enum: [
      "major",
      "minor",
      "republish",
    ],
  },
  parts: {
    type: "array",
    items: {
      type: "object",
      additionalProperties: false,
      required: [
        "title",
        "slug",
        "body",
      ],
      properties: {
        title: {
          type: "string",
        },
        slug: {
          type: "string",
          format: "uri",
        },
        body: {
          "$ref": "#/definitions/body_html_and_govspeak",
        },
      },
    },
  },
  political: {
    type: "boolean",
    description: "If the content is considered political in nature, reflecting views of the government it was published under.",
  },
  title: {
    type: "string",
  },
  title_optional: {
    type: "string",
  },
  locale: {
    type: "string",
    enum: [
      "ar",
      "az",
      "be",
      "bg",
      "bn",
      "cs",
      "cy",
      "de",
      "dr",
      "el",
      "en",
      "es",
      "es-419",
      "et",
      "fa",
      "fr",
      "he",
      "hi",
      "hu",
      "hy",
      "id",
      "it",
      "ja",
      "ka",
      "ko",
      "lt",
      "lv",
      "ms",
      "pl",
      "ps",
      "pt",
      "ro",
      "ru",
      "si",
      "sk",
      "so",
      "sq",
      "sr",
      "sw",
      "ta",
      "th",
      "tk",
      "tr",
      "uk",
      "ur",
      "uz",
      "vi",
      "zh",
      "zh-hk",
      "zh-tw",
    ],
  },
  multiple_content_types: {
    type: "array",
    items: {
      type: "object",
      additionalProperties: false,
      required: [
        "content_type",
        "content",
      ],
      properties: {
        content_type: {
          type: "string",
        },
        content: {
          type: "string",
        },
      },
    },
  },
  asset_link: {
    type: "object",
    additionalProperties: false,
    required: [
      "url",
      "content_type",
    ],
    properties: {
      content_id: {
        "$ref": "#/definitions/guid",
      },
      url: {
        type: "string",
        format: "uri",
      },
      content_type: {
        type: "string",
      },
      title: {
        type: "string",
      },
      created_at: {
        format: "date-time",
      },
      updated_at: {
        format: "date-time",
      },
    },
  },
  asset_link_list: {
    description: "An ordered list of asset links",
    type: "array",
    items: {
      "$ref": "#/definitions/asset_link",
    },
  },
  change_note: {
    description: "Change note for the most recent update",
    type: [
      "string",
      "null",
    ],
  },
  change_history: {
    type: "array",
    items: {
      type: "object",
      additionalProperties: false,
      properties: {
        public_timestamp: {
          type: "string",
          format: "date-time",
        },
        note: {
          type: "string",
          description: "A summary of the change",
        },
      },
      required: [
        "public_timestamp",
        "note",
      ],
    },
  },
  withdrawn_notice: {
    type: "object",
    additionalProperties: false,
    properties: {
      explanation: {
        type: "string",
      },
      withdrawn_at: {
        format: "date-time",
      },
    },
  },
  nation_applicability: {
    description: "An object specifying the applicability of a particular nation.",
    type: "object",
    additionalProperties: false,
    properties: {
      label: {
        description: "The pretty-printed, translated label for this nation.",
        type: "string",
      },
      alternative_url: {
        description: "An optional alternative URL to link to for more information on this content item pertaining to this nation.",
        type: "string",
      },
      applicable: {
        description: "Whether the content applies to this nation or not.",
        type: "boolean",
      },
    },
  },
  national_applicability: {
    description: "An object specifying the applicable nations for this content item. If it applies to all nations, it should be omitted.",
    type: "object",
    additionalProperties: false,
    properties: {
      england: {
        "$ref": "#/definitions/nation_applicability",
      },
      northern_ireland: {
        "$ref": "#/definitions/nation_applicability",
      },
      scotland: {
        "$ref": "#/definitions/nation_applicability",
      },
      wales: {
        "$ref": "#/definitions/nation_applicability",
      },
    },
  },
  label_value_pair: {
    description: "One of many possible values a user can select from",
    type: "object",
    additionalProperties: false,
    required: [
      "label",
      "value",
    ],
    properties: {
      label: {
        description: "A human readable label",
        type: "string",
      },
      value: {
        description: "A value to use for form controls",
        type: "string",
      },
    },
  },
  emphasised_organisations: {
    description: "The content ids of the organisations that should be displayed first in the list of organisations related to the item, these content ids must be present in the item organisation links hash.",
    type: "array",
    items: {
      "$ref": "#/definitions/guid",
    },
  },
  body: {
    description: "The main content provided as HTML rendered from govspeak",
    type: "string",
  },
  body_html_and_govspeak: {
    description: "The main content provided as HTML with the govspeak markdown it's rendered from",
    anyOf: [
      {
        "$ref": "#/definitions/multiple_content_types",
      },
    ],
  },
  attachments_with_thumbnails: {
    description: "An ordered list of attachments",
    type: "array",
    items: {
      description: "Generated HTML for each attachment including thumbnail and download link",
      type: "string",
    },
  },
  first_public_at: {
    description: "DEPRECATED. The date the content was first published. Used in details. Will be deprecated in favour of top level first_published_at when publishing API allows it to be edited.",
    type: "string",
    format: "date-time",
  },
  first_published_at: {
    description: "The date the content was first published.  Automatically determined by the publishing-api, unless overridden by the publishing application.",
    type: "string",
    format: "date-time",
  },
  public_updated_at: {
    description: "When the content was last significantly changed (a major update). Shown to users.  Automatically determined by the publishing-api, unless overridden by the publishing application.",
    type: "string",
    format: "date-time",
  },
  tags: {
    type: "object",
    description: "Field used by email-alert-api to trigger email alerts for subscriptions to topics (gov.uk/topic) and policies (gov.uk/policies).",
    additionalProperties: false,
    properties: {
      browse_pages: {
        type: "array",
        items: {
          type: "string",
        },
      },
      topics: {
        type: "array",
        items: {
          type: "string",
        },
      },
      primary_topic: {
        type: "array",
        items: {
          type: "string",
        },
      },
      additional_topics: {
        type: "array",
        items: {
          type: "string",
        },
      },
      policies: {
        type: "array",
        items: {
          type: "string",
        },
      },
    },
  },
  email_signup_link: {
    description: "Path to email signup form. TODO: Check if can be switched to use links instead",
    type: "string",
    format: "uri",
  },
  publishing_request_id: {
    description: "A unique identifier used to track publishing requests to rendered content",
    oneOf: [
      { type: "string" },
      { type:"null" },
    ],
  },
  max_cache_time: {
    description: "The maximum length of time the content should be cached, in seconds",
    type: "integer",
  },
  grouped_lists_of_links: {
    description: "Lists of links with titles in named groups",
    type: "array",
    items: {
      type: "object",
      additionalProperties: false,
      required: [
        "name",
        "contents",
      ],
      properties: {
        name: {
          description: "Title of the group",
          type: "string",
        },
        contents: {
          description: "An ordered list of links, either internal with GUID or external with URL and title",
          type: "array",
          items: {
            "$ref": "#/definitions/internal_or_external_link",
          },
        },
      },
    },
  },
  topic_groups: {
    description: "Lists of items with titles & paths in named groups, used for showing curated links on browse pages and topics",
    type: "array",
    items: {
      type: "object",
      additionalProperties: false,
      required: [
        "name",
        "contents",
      ],
      properties: {
        name: {
          type: "string",
        },
        description: {
          description: "DEPRECATED",
          type: "string",
        },
        contents: {
          type: "array",
          items: {
            "$ref": "#/definitions/absolute_path",
          },
        },
        content_ids: {
          description: "DEPRECATED",
          "$ref": "#/definitions/guid_list",
        },
      },
    },
  },
  service_manual_topic_groups: {
    description: "Lists of items with titles & content IDs in named groups, used for service manual topic pages",
    type: "array",
    items: {
      type: "object",
      additionalProperties: false,
      required: [
        "name",
      ],
      properties: {
        name: {
          type: "string",
        },
        description: {
          type: "string",
        },
        content_ids: {
          "$ref": "#/definitions/guid_list",
        },
      },
    },
  },
  taxonomy_internal_name: {
    type: "string",
    description: "An internal name for taxonomy admin interfaces. Includes parent.",
  },
  manual_section_parent: {
    description: "The parent manual for a manual section",
    type: "object",
    additionalProperties: false,
    required: [
      "base_path",
    ],
    properties: {
      base_path: {
        "$ref": "#/definitions/absolute_path",
      },
    },
  },
  manual_organisations: {
    description: "A manual’s organisations. TODO: Switch to use organisations in links",
    type: "array",
    items: {
      type: "object",
      additionalProperties: false,
      required: [
        "title",
        "abbreviation",
        "web_url",
      ],
      properties: {
        title: {
          type: "string",
        },
        abbreviation: {
          type: "string",
        },
        web_url: {
          type: "string",
        },
      },
    },
  },
  hmrc_manual_change_notes: {
    description: "A history of changes to HMRC manuals and the associated section. section_id is included and required making it different to manual_change_notes",
    type: "array",
    items: {
      type: "object",
      additionalProperties: false,
      required: [
        "section_id",
        "base_path",
        "title",
        "change_note",
        "published_at",
      ],
      properties: {
        section_id: {
          type: "string",
        },
        base_path: {
          "$ref": "#/definitions/absolute_path",
        },
        title: {
          type: "string",
        },
        change_note: {
          type: "string",
        },
        published_at: {
          type: "string",
          format: "date-time",
        },
      },
    },
  },
  manual_change_notes: {
    description: "A history of changes to manuals and the associated section",
    items: {
      type: "object",
      additionalProperties: false,
      required: [
        "base_path",
        "title",
        "change_note",
        "published_at",
      ],
      properties: {
        base_path: {
          "$ref": "#/definitions/absolute_path",
        },
        title: {
          type: "string",
        },
        change_note: {
          type: "string",
        },
        published_at: {
          type: "string",
          format: "date-time",
        },
      },
    },
  },
  manual_child_section_groups: {
    description: "Grouped sections of a manual",
    type: "array",
    items: {
      type: "object",
      additionalProperties: false,
      required: [
        "title",
        "child_sections",
      ],
      properties: {
        title: {
          type: "string",
        },
        child_sections: {
          type: "array",
          items: {
            required: [
              "title",
              "description",
              "base_path",
            ],
            additionalProperties: false,
            type: "object",
            properties: {
              title: {
                type: "string",
              },
              description: {
                type: "string",
              },
              base_path: {
                "$ref": "#/definitions/absolute_path",
              },
            },
          },
        },
      },
    },
  },
  hmrc_manual_child_section_groups: {
    description: "Grouped sections of an HMRC manual. Differs from manuals as section_id is required and group titles are optional.",
    type: "array",
    items: {
      type: "object",
      additionalProperties: false,
      required: [
        "child_sections",
      ],
      properties: {
        title: {
          type: "string",
        },
        child_sections: {
          type: "array",
          items: {
            required: [
              "section_id",
              "title",
              "description",
              "base_path",
            ],
            additionalProperties: false,
            type: "object",
            properties: {
              section_id: {
                type: "string",
              },
              title: {
                type: "string",
              },
              description: {
                type: "string",
              },
              base_path: {
                "$ref": "#/definitions/absolute_path",
              },
            },
          },
        },
      },
    },
  },
  hmrc_manual_breadcrumbs: {
    description: "Breadcrumbs for HMRC manuals based on section",
    type: "array",
    items: {
      type: "object",
      additionalProperties: false,
      required: [
        "base_path",
        "section_id",
      ],
      properties: {
        base_path: {
          "$ref": "#/definitions/absolute_path",
        },
        section_id: {
          type: "string",
        },
      },
    },
  },
  email_alert_signup_breadcrumbs: {
    description: "DEPRECATED. Breadcrumbs for email alert signup. Should use parent in links as other formats do.",
    type: "array",
    items: {
      type: "object",
      additionalProperties: false,
      required: [
        "link",
        "title",
      ],
      properties: {
        link: {
          type: "string",
          format: "uri",
        },
        title: {
          type: "string",
        },
      },
    },
  },
  finder_document_noun: {
    description: "How to refer to documents when presenting the search results",
    type: "string",
  },
  finder_default_documents_per_page: {
    description: "Specify this to paginate results",
    type: "integer",
  },
  finder_default_order: {
    description: "Rummager fields to order the results by",
    type: "string",
  },
  finder_filter: {
    description: "This is the fixed filter that scopes the finder",
    type: "object",
    additionalProperties: false,
    properties: {
      document_type: {
        type: "string",
      },
      organisations: {
        type: "array",
        items: {
          type: "string",
        },
      },
      policies: {
        type: "array",
        items: {
          type: "string",
        },
      },
      format: {
        type: "string",
      },
    },
  },
  finder_reject_filter: {
    description: "A fixed filter that rejects documents which match the conditions",
    type: "object",
    additionalProperties: false,
    properties: {
      policies: {
        type: "array",
        items: {
          type: "string",
        },
      },
    },
  },
  finder_facets: {
    description: "The facets shown to the user to refine their search.",
    type: "array",
    items: {
      type: "object",
      additionalProperties: false,
      required: [
        "key",
        "filterable",
        "display_as_result_metadata",
      ],
      properties: {
        key: {
          description: "The rummager field name used for this facet.",
          type: "string",
        },
        filterable: {
          description: "This must be true to show the facet to users.",
          type: "boolean",
        },
        display_as_result_metadata: {
          description: "Include this in search result metadata. Can be set for non-filterable facets.",
          type: "boolean",
        },
        name: {
          description: "Label for the facet.",
          type: "string",
        },
        preposition: {
          description: "Text used to augment the description of the search when the facet is used.",
          type: "string",
        },
        short_name: {
          type: "string",
        },
        type: {
          description: "Defines the UI component and how the facet is queried from the search API",
          type: "string",
          enum: [
            "text",
            "date",
            "topical",
          ],
        },
        allowed_values: {
          description: "Possible values to show for non-dynamic select facets. All values are shown regardless of the search.",
          type: "array",
          items: {
            "$ref": "#/definitions/label_value_pair",
          },
        },
        open_value: {
          description: "Value that determines the open state (the key field is in the future) of a topical facet.",
          "$ref": "#/definitions/label_value_pair",
        },
        closed_value: {
          description: "Value that determines the closed state (the key field is in the past) of a topical facet.",
          "$ref": "#/definitions/label_value_pair",
        },
      },
    },
  },
  finder_show_summaries: {
    type: "boolean",
  },
  finder_summary: {
    anyOf: [
      {
        type: "string",
      },
      {
        type: "null",
      },
    ],
  },
  finder_beta: {
    description: "Indicates if finder is in beta. TODO: Switch to top-level phase label",
    anyOf: [
      {
        type: "boolean",
      },
      {
        type: "null",
      },
    ],
  },
  email_alert_signup_summary: {
    description: "TODO: Use top-level description instead",
    type: "string",
  },
  country: {
    type: "object",
    additionalProperties: false,
    required: [
      "slug",
      "name",
    ],
    properties: {
      name: {
        type: "string",
      },
      slug: {
        type: "string",
      },
      synonyms: {
        type: "array",
        items: {
          type: "string",
        },
      },
    },
  },
  will_continue_on: {
    description: "Description of the website the adjoining external link will be taking the user to",
    type: "string",
  },
  start_button_text: {
    description: "Custom text to be displayed on the green button that takes you to another page",
    type: "string",
  },
  payload_version: {
    description: "Counter to indicate when the payload was generated",
    type: "integer",
  },
}
