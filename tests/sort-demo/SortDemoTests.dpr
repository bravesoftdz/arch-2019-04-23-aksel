﻿{ * ------------------------------------------------------------------------
  * ♥  Akademia BSC © 2019  ♥
  * Console Runner:
  *   * Add "CONSOLE_TESTRUNNER" to Project -> Options -> Delphi Compiler -> Conditional defines
  *   * http://docwiki.embarcadero.com/RADStudio/Rio/en/Delphi_Compiler
  *  ----------------------------------------------------------------------- * }
program SortDemoTests;

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

TODO: zdefniuj w opcjach projektu zmienną kompilatora: APP_UNDER_TESTS
  Project -> Options -> Delphi Compiler -> Conditional defines
  Potem można skasować te linie

uses
  DUnitTestRunner,
  Model.Board in '..\..\src\sort-demo\Model.Board.pas',
  Controler.Sort in '..\..\src\sort-demo\Controler.Sort.pas',
  Thread.Sort in '..\..\src\sort-demo\Thread.Sort.pas',
  View.Board in '..\..\src\sort-demo\View.Board.pas',
  TestBoard in 'TestBoard.pas',
  TestSortControler in 'TestSortControler.pas',
  Mock.BoardView in 'Mock.BoardView.pas';

{$R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;
end.

