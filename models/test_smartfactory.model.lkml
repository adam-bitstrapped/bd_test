# Define the database connection to be used for this model.
connection: "test_smartfactory"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: test_smartfactory_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: test_smartfactory_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Test Smartfactory"

explore: numeric_data_series {
  sql_always_where: ${event_timestamp_year} > 2021 ;;
  join: numeric_data_series__meta_kv {
    view_label: "Numeric Data Series: Metakv"
    sql: LEFT JOIN UNNEST(${numeric_data_series.meta_kv}) as numeric_data_series__meta_kv ;;
    relationship: one_to_many
  }

  join: numeric_data_series__payload_kv {
    view_label: "Numeric Data Series: Payloadkv"
    sql: LEFT JOIN UNNEST(${numeric_data_series.payload_kv}) as numeric_data_series__payload_kv ;;
    relationship: one_to_many
  }

  join: numeric_data_series__payload_qualifier_kv {
    view_label: "Numeric Data Series: Payloadqualifierkv"
    sql: LEFT JOIN UNNEST(${numeric_data_series.payload_qualifier_kv}) as numeric_data_series__payload_qualifier_kv ;;
    relationship: one_to_many
  }
}
