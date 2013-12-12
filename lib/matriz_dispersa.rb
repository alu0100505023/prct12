require 'Fraccion.rb'
require 'matriz.rb'
require "matrix"

#Clase que se encarga de la creacion de las columnas y la mezcla
class SparseVector
    attr_reader :vector

    def initialize(h = {})
        @vector = Hash.new(0)
        @vector = @vector.merge!(h)
    end

    def [](i)
        @vector[i]
    end

    def to_s
        @vector.to_s
    end
end

#Clase que se encarga de crear el hash
class SparseMatrix < Matriz

    attr_reader :matrix

    # Inicializador propio de la clase
    def initialize(h = {})
        @matrix = Hash.new({})
        for k in h.keys do
            @matrix[k] = if h[k].is_a? SparseVector 
                                h[k]
                        else
                              @matrix[k] = SparseVector.new(h[k])
                            end
        end
    end

    # Obtener un valor de la matriz dada una posicion
    def [](i)
        @matrix[i]
    end

    # Devuelve la columna con el hash
    def col(j)
        c = {}
        for r in @matrix.keys do
            c[r] = @matrix[r].vector[j] if @matrix[r].vector.keys.include? j
        end
        SparseVector.new c
    end

	#Comprobacion de la dispersion
        def comprobar
                contar = 0
                contartotal = 0
                result = 0
           for r in @matrix.keys do
                         for j in @matrix[r].vector.keys do
                                contartotal = contartotal + 1
                                if @matrix[r].vector[j] == 0 
                                        contar = contar + 1
                                end
                        end
      end
                result = (contar * 100) / contartotal
                if result < 60 
                         "La matriz no es dispersa"
                end
        end
	
	#Imprime la matriz dispersa
        def mostrar
        for r in @matrix.keys do
                                  for j in @matrix[r].vector.keys do
                                        print "#{@matrix[r].vector[j]}  "  
                                end
                                puts
        end
        end

	# Operacion de la suma en la matriz dispersa. Realiza la operacion entre dos matrices dispersa y una dispersa con una densa    
        def +(other)
			  case other
			  when Matriz_Dispersa
					raise ArgumentError, "Las matrices no son iguales en longitud." unless @matrix.size == other.matrix.size && @matrix[1].vector.size == other.matrix[1].vector.size
					resul = Array.new
					 @matrix.keys.times do |r|
					 r = r + 1
					  #for r in @matrix.keys do
						resul_f = Array.new
						 1.upto(@matrix[r].vector.keys) do |j|  
						 #for j in @matrix[r].vector.keys do       
					  		#print "  #{@matrix[r].vector[j] + other.matrix[r].vector[j]}  "
							resul_f << @matrix[r].vector[j] + other.matrix[r].vector[j]
					  	end
					  		#puts
						resul << resul_f
					end
					return resul
			  when Matriz_densa
					raise ArgumentError, "Las matrices no son iguales en longitud." unless @matrix.size == other.f && @matrix[1].vector.size == other.c
					resul = Array.new
					1.upto(other.f) do |r|
					 #for r in 1..other.f do
						resul_f = Array.new
						1.upto(other.c) do |j|
						 #for j in 1..other.c do
               		#print "  #{@matrix[r].vector[j] + other.m[r - 1][j - 1]}"
							resul_f << @matrix[r].vector[j] + other.m[r - 1][j - 1]
               	end
               	#puts
						resul << resul_f
        			end
					return resul
			  else
					raise TypeError.new("No se puede pasar #{other.inspect} a Matriz")
			  end
        end
	
	# Operacion de la resta en la matriz dispersa. Realiza la operacion entre dos matrices dispersa y una dispersa con una densa
        def -(other)
			  case other
			  when Matriz_Dispersa
					raise ArgumentError, "Las matrices no son iguales en longitud." unless @matrix.size == other.matrix.size && @matrix[1].vector.size == other.matrix[1].vector.size
					resul = Array.new
		     		#for r in @matrix.keys do
					 1.upto(@matrix.keys) do |r|
						resul_f = Array.new
					  	#for j in @matrix[r].vector.keys do  
						 1.upto(@matrix[r].vector.keys) do |j|      
					  		#print "  #{@matrix[r].vector[j] - other.matrix[r].vector[j]}  "
							resul_f << @matrix[r].vector[j] - other.matrix[r].vector[j]
					  	end
					  		#puts
						resul << resul_f
					end
					return resul
			  when Matriz_densa
					raise ArgumentError, "Las matrices no son iguales en longitud." unless @matrix.size == other.f && @matrix[1].vector.size == other.c
					resul = Array.new
					#for r in 1..other.f do
					1.upto(other.f) do |r|
						resul_f = Array.new
               	#for j in 1..other.c do
						1.upto(other.c) do |j|
               		#print "  #{@matrix[r].vector[j] - other.m[r - 1][j - 1]}"
							resul_f << @matrix[r].vector[j] - other.m[r - 1][j - 1]
               	end
               	#puts
						resul << resul_f
        			end
					return resul
			  else
					raise TypeError.new("No se puede pasar #{other.inspect} a Matriz")
			  end

        end

	# Operacion de la multiplicacion en la matriz dispersa. Realiza la operacion entre dos matrices dispersa y una dispersa con una densa
        def *(other) 
        
				case other
				when Matriz_Dispersa
					 raise ArgumentError, "Las columnas de una matriz no coinciden con las filas de la otra." unless @matrix[1].vector.size == other.matrix.size
                sumatotal = 0
                mul = Array.new                

               #for i in @matrix.keys do
					1.upto(@matrix.keys) do |i|
                        mul_f = Array.new
                     #for j in @matrix[i].vector.keys do
							 1.upto(@matrix[i].vector.keys) do |j|
                                #for k in @matrix[i].vector.keys do
											 1.upto(@matrix[i].vector.keys) do |k|
                                    suma = @matrix[i].vector[k] * other.matrix[k].vector[j]
                                    sumatotal = sumatotal + suma;
                                end
                                mul_f << sumatotal
                                sumatotal = 0
                    end
							mul << mul_f
                end

					return mul
			  when Matriz_densa
					raise ArgumentError, "Las columnas de una matriz no coinciden con las filas de la otra." unless @matrix[1].vector.size == other.f
					sumatotal = 0
                mul = Array.new                

					  1.upto(@matrix.size) do |i|
                        mul_f = Array.new
                     #for j in @matrix[i].vector.keys do
							 1.upto(@matrix[i].vector.size) do |j|
                           #for k in @matrix[i].vector.keys do
									1.upto(@matrix[i].vector.size) do |k|
                              suma = @matrix[i].vector[k] * other.m[k - 1][j - 1]
                              sumatotal = sumatotal + suma;
                           end
                           mul_f << sumatotal
                           sumatotal = 0
                    end
							mul << mul_f
                end 


					return mul
			  else
				  raise TypeError.new("No se puede pasar #{other.inspect} a Matriz")
			  end
        end

	# Obtención del maximo de una matriz dispersa
        def max
                   
                maximo = @matrix[1].vector[1]
           
                #for i in @matrix.keys do
						@matrix.size.times do |i|
								i = i + 1
                        #for j in @matrix[i].vector.keys do
								#@matrix[i].vector.keys do |j|
								1.upto(@matrix[i].vector.size) do |j|
                           if @matrix[i].vector[j] > maximo
                              maximo = @matrix[i].vector[j]
                      end
                   end
                end
					 return maximo
        end

		  def [](i,j)
			
				return @matrix[i].vector[j]
			
		  end

	# Obtención del maximo de una matriz dispersa
        def min

           minimo = @matrix[1].vector[1]
                
                #for i in @matrix.keys do
						1.upto(@matrix.size) do |i|
                        #for j in @matrix[i].vector.keys do
								@matrix[i].vector.size.times do |j|
								j = j + 1
                           if @matrix[i].vector[j] < minimo
                              minimo = @matrix[i].vector[j]
                      end
                   end
                end
					return minimo

        end
	
	#Metodo coerce
        def coerce(other)
                [other,self]
        end
end

#Clase dispera heredada de SparseMatrix
class Matriz_Dispersa < SparseMatrix

end
