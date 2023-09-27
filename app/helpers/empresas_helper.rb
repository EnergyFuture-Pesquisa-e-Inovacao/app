module EmpresasHelper

    def planos_for_select
      Plano.all.collect { |m| [m.name, m.id] }
    end
    
end
