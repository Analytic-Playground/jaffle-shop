{# check if a given email address is valid #}

{% macro is_valid_email(column_name) -%}
    {{ column_name }} like '%@%.%'
{%- endmacro %}