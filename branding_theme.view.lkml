view: branding_theme {
  sql_table_name: stonebridge_ft_xero.branding_theme ;;

  dimension: branding_theme_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.branding_theme_id ;;
  }

  dimension_group: _fivetran_synced {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}._fivetran_synced ;;
  }

  dimension_group: created_date_utc {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_date_utc ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: sort_order {
    type: number
    sql: ${TABLE}.sort_order ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      branding_theme_id,
      name,
      credit_note.count,
      repeating_invoice.count,
      contact.count,
      invoice.count
    ]
  }
}
