view: manual_journal {
  sql_table_name: stonebridge_ft_xero.manual_journal ;;

  dimension: manual_journal_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.manual_journal_id ;;
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

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: has_attachments {
    type: yesno
    sql: ${TABLE}.has_attachments ;;
  }

  dimension: line_amount_types {
    type: string
    sql: ${TABLE}.line_amount_types ;;
  }

  dimension: narration {
    type: string
    sql: ${TABLE}.narration ;;
  }

  dimension: show_on_cash_basis_reports {
    type: yesno
    sql: ${TABLE}.show_on_cash_basis_reports ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension_group: updated_date_utc {
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
    sql: ${TABLE}.updated_date_utc ;;
  }

  measure: count {
    type: count
    drill_fields: [manual_journal_id, manual_journal_line.count]
  }
}
