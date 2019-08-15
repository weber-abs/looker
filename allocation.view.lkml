view: allocation {
  sql_table_name: stonebridge_ft_xero.allocation ;;

  dimension: allocation_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.allocation_id ;;
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

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: credit_note_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.credit_note_id ;;
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

  dimension: invoice_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.invoice_id ;;
  }

  dimension: overpayment_id {
    type: string
    sql: ${TABLE}.overpayment_id ;;
  }

  dimension: prepayment_id {
    type: string
    sql: ${TABLE}.prepayment_id ;;
  }

  measure: count {
    type: count
    drill_fields: [allocation_id, credit_note.credit_note_id, invoice.invoice_id]
  }
}
