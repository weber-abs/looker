view: journal_line {
  sql_table_name: stonebridge_ft_xero.journal_line ;;


  parameter: cash_on_hand_date {
    type: date
    suggest_dimension: journal.journal_dt
  }

  dimension: journal_line_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.journal_line_id ;;
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

  dimension: account_code {
    type: string
    sql: ${TABLE}.account_code ;;
  }

  dimension: account_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.account_id ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}.account_name ;;
  }

  dimension: account_type {
    type: string
    sql: ${TABLE}.account_type ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: gross_amount {
    type: number
    sql: ${TABLE}.gross_amount ;;
  }

  dimension: journal_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.journal_id ;;
  }

  dimension: net_amount {
    type: number
    sql: ${TABLE}.net_amount ;;
  }

  dimension: tax_amount {
    type: number
    sql: ${TABLE}.tax_amount ;;
  }

  dimension: tax_name {
    type: string
    sql: ${TABLE}.tax_name ;;
  }

  dimension: tax_type {
    type: string
    sql: ${TABLE}.tax_type ;;
  }

  dimension: merge_cash_on_hand_queries {
    type: string
    sql: 'cash on hand' ;;
  }

  measure: total_amount {
    type: sum
    sql: ${net_amount} ;;
    value_format: "$#,##0.00"
  }

  measure: total_revenue {
    type: sum
    sql: CASE WHEN account.type = 'REVENUE' THEN -1 * ${net_amount} ELSE 0 END ;;
    value_format: "$#,##0.00"
  }

  measure: total_expense {
    type: sum
    sql: CASE WHEN account.type = 'EXPENSE' THEN -1 * ${net_amount} ELSE 0 END  ;;
    value_format: "$#,##0.00"
  }

  measure: cash_on_hand_add {
    type: sum
    sql:  CASE WHEN account.code IN ('1005', '1017') THEN ${net_amount} ELSE 0 END  ;;
    value_format: "$#,##0.00"
  }

  measure: cash_on_hand_subtract {
    type: sum
    sql: CASE WHEN account.code = '2400' THEN ${net_amount} ELSE 0 END ;;
    value_format: "$#,##0.00"
  }

  measure: cash_on_hand_total_expenses {
    type: sum
    sql: (CASE WHEN account.code NOT IN ('7400', '7300', '6240') AND account.type = 'EXPENSE'
    AND DATE_ADD(DATE({% parameter cash_on_hand_date %}), INTERVAL -364 DAY) <= DATE(journal.journal_date) THEN ${net_amount} else 0 end)/365   ;;
    value_format: "$#,##0.00"

  }

  measure: cash_on_hand {
    type: number
    sql: ${cash_on_hand_add} - ABS(${cash_on_hand_subtract}) ;;
    value_format: "$#,##0.00"
  }

  measure: net_income {
    type: sum
    sql: -1 * ${net_amount} ;;
    value_format: "$#,##0.00"
    html:
    {{ rendered_value }} <br>
    {{ total_revenue._rendered_value }} Revenue || {{ total_expense._rendered_value}} Expense ;;
  }


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      journal_line_id,
      tax_name,
      account_name,
      journal.journal_id,
      account.account_id,
      account.reporting_code_name,
      account.name,
      journal_line_has_tracking_category.count
    ]
  }
}
