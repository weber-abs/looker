view: organization {
  sql_table_name: stonebridge_ft_xero.organization ;;

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

  dimension: apikey {
    type: string
    sql: ${TABLE}.apikey ;;
  }

  dimension: base_currency {
    type: string
    sql: ${TABLE}.base_currency ;;
  }

  dimension: class {
    type: string
    sql: ${TABLE}.class ;;
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}.country_code ;;
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

  dimension: default_purchases_tax {
    type: string
    sql: ${TABLE}.default_purchases_tax ;;
  }

  dimension: default_sales_tax {
    type: string
    sql: ${TABLE}.default_sales_tax ;;
  }

  dimension: edition {
    type: string
    sql: ${TABLE}.edition ;;
  }

  dimension: employer_identification_number {
    type: string
    sql: ${TABLE}.employer_identification_number ;;
  }

  dimension_group: end_of_year_lock {
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
    sql: ${TABLE}.end_of_year_lock_date ;;
  }

  dimension: financial_year_end_day {
    type: number
    sql: ${TABLE}.financial_year_end_day ;;
  }

  dimension: financial_year_end_month {
    type: number
    sql: ${TABLE}.financial_year_end_month ;;
  }

  dimension: is_demo_company {
    type: yesno
    sql: ${TABLE}.is_demo_company ;;
  }

  dimension: legal_name {
    type: string
    sql: ${TABLE}.legal_name ;;
  }

  dimension: line_of_business {
    type: string
    sql: ${TABLE}.line_of_business ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: organisation_entity_type {
    type: string
    sql: ${TABLE}.organisation_entity_type ;;
  }

  dimension: organisation_id {
    type: string
    sql: ${TABLE}.organisation_id ;;
  }

  dimension: organisation_status {
    type: string
    sql: ${TABLE}.organisation_status ;;
  }

  dimension: organisation_type {
    type: string
    sql: ${TABLE}.organisation_type ;;
  }

  dimension: pays_tax {
    type: yesno
    sql: ${TABLE}.pays_tax ;;
  }

  dimension_group: period_lock {
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
    sql: ${TABLE}.period_lock_date ;;
  }

  dimension: registration_number {
    type: string
    sql: ${TABLE}.registration_number ;;
  }

  dimension: sales_tax_basis {
    type: string
    sql: ${TABLE}.sales_tax_basis ;;
  }

  dimension: sales_tax_period {
    type: string
    sql: ${TABLE}.sales_tax_period ;;
  }

  dimension: short_code {
    type: string
    sql: ${TABLE}.short_code ;;
  }

  dimension: tax_number {
    type: string
    sql: ${TABLE}.tax_number ;;
  }

  dimension: tax_number_name {
    type: string
    sql: ${TABLE}.tax_number_name ;;
  }

  dimension: timezone {
    type: string
    sql: ${TABLE}.timezone ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }

  measure: count {
    type: count
    drill_fields: [legal_name, tax_number_name, name]
  }
}
