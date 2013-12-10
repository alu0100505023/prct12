
require 'gcd.rb'

#Clase para el calculo entre fracciones
class Fraccion
        include Comparable

        attr_reader :n, :d
        def initialize (n,d)
                @n=n
                @d=d
        end
	
	#Pasa el resultado a string
        def to_s
                
                "#{@n}/#{@d}"                
        end	

	#Calcula el minimo
        def min 
                a=gcd(@n,@d)

                @n = @n/a
                @d = @d/a

                if gcd(@n, @d) > 1
                        self.min
                end
        end
	
	#Devuelve numerador
        def getn
                return @n
        end

        #Devuelve denominador
        def getd
                return @d
        end

        #Pasa a flotante
        def to_f
                #puts "Flotante: #{@n.to_f/@d.to_f}"
                "#{@n.to_f/@d.to_f}"
                #f4 = Fraccion.new(@n.to_f, @d.to_f)
                #return f4
        end

	#Calculo del valor absoluto
        def abs
                n = @n
                d = @d

                if @n < 0
                        n = -@n
                end

                if @d < 0
                        d = -@d
                end
                Fraccion.new(n, d)
        end
	
	#Cambia numerador por denominador
        def reciprocal
                Fraccion.new(@d,@n)
        end
        
	#Da el negativo.
        def opuesto
                Fraccion.new(-@n,@d)
        end
	
	#Suma entra fracciones
        def + (other)
                if other.instance_of?Fixnum
                        n=(@n*1+(@d*other))
                        d=(@d*1)
                        
                else
                        n=(@n*other.d)+(@d*other.n)
                        d=(@d*other.d)
                end
                #"#{f4.n/f4.d}"
                f4=Fraccion.new(n,d)
                f4.min
                return f4
        end

	#Resta entre fracciones
        def - (other)
               if other.instance_of?Fixnum
                        n=(@n*1-(@d*other))
                        d=(@d*1)
                        
                else
                        n=(@n*other.d)-(@d*other.n)
                        d=(@d*other.d)
                end
                #"#{f4.n/f4.d}"
                f4=Fraccion.new(n,d)
                f4.min
                return f4
        end
	
	#Multiplicacion entre fracciones
        def * (other)
                if other.instance_of?Fixnum
                        other = Fraccion.new(other,1)
                        n=(@n *(other.n))
                        d=(@d*1)
                        
                else
                        n=(@n*other.n)
                        d=(@d*other.d)
        
                end
                f4=Fraccion.new(n,d)
                f4.min
                #"#{f4.n/f4.d}"
                return f4

        end
	
	#Division entre fracciones
        def / (other)
                n=@n*other.d
                d=@d*other.n
                f4=Fraccion.new(n,d)
                f4.min
                "#{f4.n/f4.d}"
        end

	#Comparaciones entre fracciones
        def <=>(other)
                self.to_f<=>other.to_f
                                
        end

	#Metodo coerce
        def coerce(other)
                return [self,other]
        end
end
