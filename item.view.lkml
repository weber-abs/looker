view: item {
  sql_table_name: stonebridge_ft_xero.item ;;

  dimension: item_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.item_id ;;
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

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: inventory_asset_account_code {
    type: number
    sql: ${TABLE}.inventory_asset_account_code ;;
  }

  dimension: is_purchased {
    type: yesno
    sql: ${TABLE}.is_purchased ;;
  }

  dimension: is_sold {
    type: yesno
    sql: ${TABLE}.is_sold ;;
  }

  dimension: is_tracked_as_inventory {
    type: yesno
    sql: ${TABLE}.is_tracked_as_inventory ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: purchase_description {
    type: string
    sql: ${TABLE}.purchase_description ;;
  }

  dimension: purchase_details_account_code {
    type: string
    sql: ${TABLE}.purchase_details_account_code ;;
  }

  dimension: purchase_details_cogsaccount_code {
    type: string
    sql: ${TABLE}.purchase_details_cogsaccount_code ;;
  }

  dimension: purchase_details_tax_type {
    type: string
    sql: ${TABLE}.purchase_details_tax_type ;;
  }

  dimension: purchase_details_unit_price {
    type: number
    sql: ${TABLE}.purchase_details_unit_price ;;
  }

  dimension: quantity_on_hand {
    type: number
    sql: ${TABLE}.quantity_on_hand ;;
  }

  dimension: sales_details_account_code {
    type: string
    sql: ${TABLE}.sales_details_account_code ;;
  }

  dimension: sales_details_cogsaccount_code {
    type: string
    sql: ${TABLE}.sales_details_cogsaccount_code ;;
  }

  dimension: sales_details_tax_type {
    type: string
    sql: ${TABLE}.sales_details_tax_type ;;
  }

  dimension: sales_details_unit_price {
    type: number
    sql: ${TABLE}.sales_details_unit_price ;;
  }

  dimension: total_cost_pool {
    type: number
    sql: ${TABLE}.total_cost_pool ;;
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
    drill_fields: [item_id, name]
  }
}
