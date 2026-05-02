{% macro calculate_revenue(quantity, price) %}

({{ quantity }} * {{price}})
    
{% endmacro %}