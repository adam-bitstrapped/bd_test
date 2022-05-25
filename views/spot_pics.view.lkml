# The name of this view in Looker is "Spot Pics"
view: spot_pics {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `spotsmartfactory.spot_pics`
    ;;
  drill_fields: [image_name]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: image_name {
    primary_key: yes
    type: string
    sql: ${TABLE}.image_name ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Auth URL" in Explore.

  dimension: auth_url {
    type: string
    sql: ${TABLE}.auth_url ;;
  }

  dimension: pic {
    type: string
    sql: ${TABLE}.auth_url ;;
    html: <img src="{{value}}" height=200 width=200 /> ;;
  }

  dimension: gcs_uri {
    type: string
    sql: ${TABLE}.gcs_uri ;;
  }

  dimension: label {
    type: string
    sql: ${TABLE}.label ;;
  }

  dimension: timestamp {
    type: string
    sql: ${TABLE}.timestamp ;;
  }

  measure: count {
    type: count
    drill_fields: [image_name]
  }
}
