module ApplicationHelper
    def errors_for(form, field)
        tag.p(form.object.errors[field].try(:first), class: 'invalid-feedback')
    end 
    
    def time_format(datetime)
        datetime.strftime('%H:%M') unless datetime.blank?
    end

    #def date_formatinvertida(date)
    #    date.strfdate('mm/dd/yyyy') unless date.blank?
    #end
end
