view: manual_journal_line {
  sql_table_name: stonebridge_ft_xero.manual_journal_line ;;

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

  dimension: account_code {
    type: string
    sql: ${TABLE}.account_code ;;
  }

  dimension: account_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.account_id ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: is_blank {
    type: yesno
    sql: ${TABLE}.is_blank ;;
  }

  dimension: line {
    type: number
    sql: ${TABLE}.line ;;
  }

  dimension: line_amount {
    type: number
    sql: ${TABLE}.line_amount ;;
  }

  dimension: manual_journal_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.manual_journal_id ;;
  }

  dimension: tax_amount {
    type: number
    sql: ${TABLE}.tax_amount ;;
  }

  dimension: tax_type {
    type: string
    sql: ${TABLE}.tax_type ;;
  }

  measure: count {
    type: count
    drill_fields: [account.account_id, account.reporting_code_name, account.name, manual_journal.manual_journal_id]
  }
}
