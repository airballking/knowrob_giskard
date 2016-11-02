:- module(knowrob_giskard,
  [
    control_gain/1
  ]).

:- use_module(library('semweb/rdfs')).
:- use_module(library('semweb/rdf_db')).
:- use_module(library('owl_parser')).
:- use_module(library('owl')).
:- use_module(library('knowrob_math')).

:- rdf_db:rdf_register_ns(rdf, 'http://www.w3.org/1999/02/22-rdf-syntax-ns#', [keep(true)]).
:- rdf_db:rdf_register_ns(owl, 'http://www.w3.org/2002/07/owl#', [keep(true)]).
:- rdf_db:rdf_register_ns(knowrob, 'http://knowrob.org/kb/knowrob.owl#', [keep(true)]).
:- rdf_db:rdf_register_ns(controllers, 'http://knowrob.org/kb/controllers.owl#', [keep(true)]).

:- rdf_meta 
         control_gain(r).

:- owl_parse('package://knowrob_giskard/owl/controllers.owl').

control_gain(Gain) :-
  owl_subclass_of(Class, controllers:'Gain'),
  not(rdf_equal(Class, controllers:'Gain')),
  owl_individual_of(Gain, Class).
