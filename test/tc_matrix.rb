require "Fraccion.rb"
require 'gcd.rb'
require 'matriz_dispersa.rb'
require 'matriz_densa.rb'
require "test/unit"

#Test de pruebas unitarias
class TestMatrix < Test::Unit::TestCase
  
	#Carga de matrices para las pruebas
	def setup
		#Se especifican los hash a usar en las pruebas
		@h = Matriz_Dispersa.new 1 => {1 => 33, 2 => 44}, 2 => {1 => 66, 2 => 77}
		@h2 = Matriz_Dispersa.new 1 => {1 => 1, 2 => 2}, 2 => {1 => 1, 2 => 2}

		#Se especifican los hash a usar en las pruebas con fracciones
		@h3 = Matriz_Dispersa.new 1 => {1 => Fraccion.new(33,2), 2 => Fraccion.new(44,3)}, 2 => {1 => Fraccion.new(66,5), 2 => Fraccion.new(77,12)}
		@h4 = Matriz_Dispersa.new 1 => {1 => 1, 2 => 2}, 2 => {1 => 1, 2 => 2}
		@h5 = Matriz_Dispersa.new 1 => {1 => Fraccion.new(1,1), 2 => Fraccion.new(2,1)}, 2 => {1 => Fraccion.new(1,1), 2 => Fraccion.new(2,1)}
		@h6 = Matriz_densa.new(2,2,[[4,3],[5,8]])
		
		@h9 = Matriz_densa.new(2,2,[[4,5],[2,3]])
		@h10 = Matriz_Dispersa.new 1 => {1 => 0, 2 => 0}, 2 => {1 => 0, 2 => Fraccion.new(1,2)}
		@h11 = Matriz_densa.new(2,2,[[4,5],[2,Fraccion.new(7,2)]])
		@h12 = Matriz_densa.new(2,2,[[-4,-5],[-2,Fraccion.new(-5,2)]])
		@h13 = Matriz_densa.new(2,2,[[0,0],[Fraccion.new(1,1),Fraccion.new(3,2)]])
	end
	
	#Pruebas de suma entre dos matrices
	def test_suma_densa_dispersa
		assert_equal(@h11.m, @h9+@h10, "Resultado Incorrecto" )
	end
	
	#Pruebas de resta entre dos matrices
	def test_resta_densa_dispersa
		assert_equal(@h12.m, @h9-@h10, "Resultado Incorrecto" )
	end

	#Pruebas de multiplicacion entre dos matrices
	def test_multi_densa_dispersa
		assert_equal(@h13.m, @h9*@h10, "Resultado Incorrecto" )
	end

	#Pruebas de calculo de maximo en una matriz dispersa
	def test_max_dispersa
		assert_equal(Fraccion.new(77,12), @h3.max, "Resultado Incorrecto" )
	end
	#Pruebas de calculo de minimo
	def test_min_dispersa
		assert_equal(Fraccion.new(66,5), @h3.min, "Resultado Incorrecto" )
	end
	
	#Pruebas de calculo de maximo en una matriz densa
	def test_max_densa
		assert_equal(8, @h6.max, "Resultado Incorrecto" )
	end
	
	#Pruebas de calculo de minimo en una matriz densa
	def test_min_densa
		assert_equal(3, @h6.min, "Resultado Incorrecto" )
	end

end


