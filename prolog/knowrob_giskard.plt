:- begin_tests(knowrob_giskard).

%% :- use_module(library('semweb/rdf_db')).
%% :- use_module(library('semweb/rdfs')).
:- use_module(library('owl')).
:- use_module(library('owl_parser')).
:- use_module(library('knowrob_giskard')).

:- owl_parser:owl_parse('package://knowrob_giskard/owl/controllers_test.owl').

:- rdf_db:rdf_register_prefix(controllers, 'http://knowrob.org/kb/controllers.owl#', [keep(true)]).

test(control_gain) :-
  findall(G, control_gain(G), Gs),
  Gs = ['http://knowrob.org/kb/controllers.owl#PGain_OdhJed'].

test(hasExpression) :-
  findall(E, owl_has(controllers:'PGain_OdhJed', controllers:'hasExpression', E), Es),
  Es = ['http://knowrob.org/kb/controllers.owl#DoubleConst_0dhJed'].

test(isExpressionOf) :-
  findall(E, owl_has(E, controllers:'isExpressionOf', controllers:'PGain_OdhJed'), Es),
  Es = ['http://knowrob.org/kb/controllers.owl#DoubleConst_0dhJed'].


:- end_tests(knowrob_giskard).
