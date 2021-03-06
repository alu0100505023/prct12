
require "matriz.rb"
require "matriz_dispersa.rb"
require "matriz_densa.rb"

class MatrizDSL < Matriz
  attr_accessor :resultado
  
  def initialize(t_op, &block)

      @operandos = []
      @resultado = nil
      @tipo_resultado = :densa
      @modo = :consola
      @operacion = :lectura
      
      case t_op
        when "suma"
          @operacion = :suma
        when "resta"
          @operacion = :resta
        when "multiplicacion"
          @operacion = :multiplicacion
        when "lectura"
          @operacion = :lectura
        else
          puts "Error en los datos", t_op
      end

      if block_given?  
        if block.arity == 1
          yield self
        else
          instance_eval &block 
        end
      end

      inicio

  end

   def operando(m)
      raise ArgumentError , 'Tipo invalido' unless m.is_a? Array
      @operandos << Matriz_densa.new(m)
   end
    
    def opcion(str)
      raise ArgumentError , 'Tipo invalido' unless str.is_a? String
      st = str.downcase
      
      case st
        when "densa"
          @tipo_resultado = :densa
        when "dispersa"
          @tipo_resultado = :dispersa
        when "consola"
          @modo = :consola
        when "fichero"
          @modo = :fichero
        when "nada"
          @modo = :nada
        else
          puts "Error en los datos", st
      end
    end
  
  def inicio
  
    case @operacion
        when :lectura
          
          if (@tipo_resultado == :densa)
	     @resultado = Matriz_densa.new(@operandos[0])

          elsif(@tipo_resultado == :dispersa)
            @resultado = Matriz_Dispersa.new(@operando[0])
            if(@resultado.null_percent > 0.6)
              @resultado = Matriz_Dispersa.new(@operando[0])
            end
          end
          
          if(@modo == :consola)
            puts @resultado.m
          end

        when :suma

          @resultado = @operandos[0]+@operandos[1]
          if (@tipo_resultado == :dispersa) 
            @resultado = Matriz_Dispersa.new(@resultado)
          end

	  if (@tipo_resultado == :densa) 
            @resultado = Matriz_densa.new(@resultado)
          end
          
          if (@modo == :consola)
            puts @resultado.m
          end

        when :resta
           @resultado = @operandos[0]-@operandos[1]
          if (@tipo_resultado == :dispersa)
            @resultado = Matriz_Dispersa.new(@resultado)
          end

	  if (@tipo_resultado == :densa) 
            @resultado = Matriz_densa.new(@resultado)
          end
          
          if (@modo == :consola)
            puts @resultado.m
          end

        when :multiplicacion
          @resultado = @operandos[0]*@operandos[1]
          if (@tipo_resultado == :dispersa) 
            @resultado = Matriz_Dispersa.new(@resultado)
          end

	  if (@tipo_resultado == :densa) 
            @resultado = Matriz_densa.new(@resultado)
          end
          
          if (@modo == :consola)
            puts @resultado.m
          end

        else
          puts "Error con la operacion", @operacion
      end
  end

end

=begin
ejemplo = MatrizDSL.new("suma") do

	opcion "densa"
	opcion "consola"
	  		
	operando [[1,2,3],[4,5,6],[7,8,9]]
	operando [[1,1,1],[1,1,1],[1,1,1]]

end
=end
