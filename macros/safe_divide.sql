{# macro for ensuring division operations do not throw errors when /0 #}

{% macro safe_divide(numerator, denominator) -%}
        case 
            when {{ denominator }} = 0 then null 
            when {{ denominator }} is null then null 
            else {{ numerator }} / {{ denominator }} 
        end
{%- endmacro %}