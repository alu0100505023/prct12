# T50MatrizDispersaDensa

## Descripción

Esta es una práctica para la Universidad de La Laguna, realizada por los alumnos Javier Clemente Rodriguez Gómez y Juan Lucas González Hidalgo para la asignatura Lenguajes y Paradigma de la Programación en el curso 2013/2014.

Gema que contempla la creación de Matrices. Utiliza una representación para matrices densas y otra diferente para matrices dispersas. Se establece una relación de herencia entre las clases que se utilizan para su representación. Se implementan las operaciones básicas, que difieren según el tipo de matriz.

En la nueva práctica se pide implementar dos métodos max y min que devuelvan el valor máximo y el minimo respectivamente de una matriz.

Se ha creado un lenguaje DSL para facilitar el trabajo con las matrices.

Las dependencias halladas con Gemnasium son:
-Gemfile
-t50_matriz_dispersa_densa.gemspec


## Diseño

El árbol de directorios queda establecido de la siguiente manera:

├── bin
│   └── t50_matriz_dispersa_densa
├── lib
│   ├── Fraccion.rb
│   ├── gcd.rb
│   ├── matriz_densa.rb
│   ├── matriz_dispersa.rb
│   ├── matriz.rb
│   ├── matriz.rb~
│   ├── t50_matriz_dispersa_densa
│   │   └── version.rb
│   └── t50_matriz_dispersa_densa.rb
├── LICENSE.txt
├── Rakefile
├── README.md
├── t50_matriz_dispersa_densa.gemspec
└── test
    └── tc_matrix.rb


El programa esta en la ruta /lib/t50_matriz_dispersa_densa.rb
En version.rb se establece la versión de la gema.
Y el ejecutable esta en la ruta /bin/t50_matriz_dispersa_densa

En el fichero t50_matriz_dispersa_densa.rb se escribira el código que vamos a utilizar dentro de un modulo para la gema. Para llevar a cabo esto se utilizara la herencia de clases en la clase matriz de la práctica anterior. Se crearan clases disperas y densas que heredan de una matriz simple que acepta enteros y fraccionales.


## Installation

Add this line to your application's Gemfile:

    gem 't50_matriz_dispersa_densa'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install t50_matriz_dispersa_densa

## Usage

Realiza un include de la gema para cargar la gema correctamente. 

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
