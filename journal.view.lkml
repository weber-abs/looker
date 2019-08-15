view: journal {
  sql_table_name: stonebridge_ft_xero.journal ;;

  dimension: journal_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.journal_id ;;
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

  dimension_group: journal {
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
    sql: ${TABLE}.journal_date ;;
  }

  dimension: journal_number {
    type: number
    sql: ${TABLE}.journal_number ;;
  }

  dimension: reference {
    type: string
    sql: ${TABLE}.reference ;;
  }

  dimension: source_id {
    type: string
    sql: ${TABLE}.source_id ;;
  }

  dimension: source_type {
    type: string
    sql: ${TABLE}.source_type ;;
  }

  measure: count {
    type: count
    drill_fields: [journal_id, journal_line.count, journal_line_has_tracking_category.count]
  }
}
