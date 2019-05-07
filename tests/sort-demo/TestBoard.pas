﻿{ * ------------------------------------------------------------------------
  * ♥  Akademia BSC © 2019  ♥
  *  ----------------------------------------------------------------------- * }
unit TestBoard;

interface

uses
  System.Generics.Collections, System.SysUtils, System.Classes,
  TestFramework,
  Model.Board;

type
  TestTBoard = class(TTestCase)
  strict private
    FBoard: TBoard;
  private
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    // TBoard.Generate
    procedure TestGenerate10Data;
    procedure TestGenerateZeroData;
    procedure TestGenerateNegativeNumberOfData;
    // TBorad.Swap:
    procedure TestSwapZeroAndOne;
    procedure TestSwapTwoLastValues;
    procedure TestSwapNegativeIndexes;
    procedure TestSwapOutOfRangeIndex;
    // TBorad.SortBubble:
    procedure TestSortBubble_123;
    procedure TestSortBubble_312;
    procedure TestSortBubble_111;
    procedure TestSortBubble_EmptyData;
    procedure TestSortBubble_50Random_Range1ToMax;
    // TBorad.Sort... :
    procedure TestSortInsertion_321;
    procedure TestSortQuick_321;
  end;

implementation

procedure TestTBoard.SetUp;
begin
  FBoard := TBoard.Create;
end;

procedure TestTBoard.TearDown;
begin
  FBoard.Free;
  FBoard := nil;
end;

procedure TestTBoard.TestGenerate10Data;
begin
  FBoard.GenerateData(10);
  CheckEquals(10, FBoard.Count, 'Nieodpowiednia liczba danych');
  (*
    Self.CheckEquals (expected, actual, msg)
    - sprawdza czy actual = expected i jeśli nie jest to zwraca negatywny
      wynik testu
    - tylko w przyapdku negatywnego wyniku wyświetalny jest komunikat msg
  *)

end;

procedure TestTBoard.TestGenerateZeroData;
begin
  // TODO: [TeamA] Zweyfikuj działanie grerate dla 0
  // TODO: [TeamD]  j.w. = takie same zadanie
  (*
    Kroki:
    1. Generate(n), gdzie n>=1 - wypełnij dowolną liczbą danych
    2. Gerate(0) - wypełniż zero elementów
    3. Zweryfikuj czy Count = 0
    4. Zweryfikuj czy Length(Data)=0
  *)
end;

procedure TestTBoard.TestGenerateNegativeNumberOfData;
begin
  // TODO: [TeamC] Wpełnić FBoard ujemną liczbą danych
  (*
    Użyj fukcji Self.StartExpectingException oraz Self.StopExpectingException
    Zobacz w żródłach: TestFramework.pas
  *)
  Self.StartExpectingException(EBoardException);
  FBoard.GenerateData(-3);
  Self.StopExpectingException('Powinien wystąpić błąd: "Zła liczba danych do generacji"');
end;

procedure TestTBoard.TestSwapZeroAndOne;
begin
  // TODO: [TeamA] Zweryfkować swap indeksów 0 i 1
  // Uwaga! Najpierw trzeba wypełnić dane
end;

procedure TestTBoard.TestSwapTwoLastValues;
begin
  // TODO: [TeamA] Zweryfkować swap dwóch ostatnich indeksów max-2 oraz max-1
  // Uwaga! Trzeba wypełnić dane przynajmiej 3 elementami
end;

procedure TestTBoard.TestSwapNegativeIndexes;
begin
  // TODO: [TeamC] Zweryfkować czy swap dwóch ujemnych indeksów rzuca wyjątkiem
  FBoard.GenerateData(10);
  Self.StartExpectingException(Exception);
  FBoard.Swap(-1, -4);
  Self.StopExpectingException('Powinien wystąpić wyjątek');
end;

procedure TestTBoard.TestSwapOutOfRangeIndex;
begin
  // TODO: [TeamD] Zweryfkować czy swap dwóch indeksów dodatkich z poza zakresu
  //   rzuca wyjątkiem
end;

procedure TestTBoard.TestSortBubble_123;
begin
  //  TODO: [TeamA] wypełnij tablicę danymi [1, 2, 3] uruchom sortowanie
  //    bąbelkowe oraz zweryfikuj czy dane wynikowe są posortowanie
end;

procedure TestTBoard.TestSortBubble_312;
var
  myThread: TThread;
  done: Boolean;
begin
  //  TODO: [TeamC] wypełnij tablicę danymi [3, 1, 2] uruchom sortowanie
  //    bąbelkowe oraz zweryfikuj czy dane wynikowe są posortowanie
  FBoard.GenerateData(3);
  FBoard.Data[0] := 3;
  FBoard.Data[1] := 1;
  FBoard.Data[2] := 2;
  done := False;
  myThread := TThread.CreateAnonymousThread(procedure
  begin
    FBoard.SortBubble;
    done := True;
  end);
  myThread.FreeOnTerminate := True;
  myThread.Start;
  while not done do
    sleep(10);

  CheckEquals(1, FBoard.Data[0], 'Nieprawidłowa wartość danych w tabeli na idx = 0');
  CheckEquals(2, FBoard.Data[1], 'Nieprawidłowa wartość danych w tabeli na idx = 1');
  CheckEquals(3, FBoard.Data[2], 'Nieprawidłowa wartość danych w tabeli na idx = 2');
end;

procedure TestTBoard.TestSortBubble_111;
begin
  //  TODO: [TeamD] wypełnij tablicę danymi [1, 1, 1] uruchom sortowanie
  //    bąbelkowe oraz zweryfikuj czy dane wynikowe są posortowanie
end;

procedure TestTBoard.TestSortBubble_EmptyData;
var
  myThread: TThread;
  tmpBoard: TBoard;
  done: Boolean;
  error: Boolean;
begin
  // [TeamC] Sprawdź czy sortowanie zadziała poprawnie dla pustego
  //   zbioru danych. Weryfikacja ma sprawdzić czy nie poawił się wyjątek
  tmpBoard := TBoard.Create;
  done := False;
  myThread := TThread.CreateAnonymousThread(procedure
  begin
    error := False;
    try
      tmpBoard.SortBubble;
    except
      error := True;
    end;
    done := True;
  end);
  myThread.FreeOnTerminate := True;
  myThread.Start;
  while not done do
    sleep(10);
  CheckFalse(error, 'Wystąpił wyjątek przy sortowaniu babelkowym pustej tablicy');
  tmpBoard.Free;
end;

procedure TestTBoard.TestSortBubble_50Random_Range1ToMax;
begin
  // TODO: [TeamA] Sprawdź czy sortowanie zadziała poprawnie dla pustego
  // TODO: [TeamD] j.w. = takie same zadanie
end;

procedure TestTBoard.TestSortInsertion_321;
var
  myThread: TThread;
  done: Boolean;
begin
  // TODO: [TeamA] Sprawdzić sortowanie InsertionSort na danych [3, 2, 1]
  // TODO: [TeamC] j.w.
  // TODO: [TeamD] j.w.
  FBoard.GenerateData(3);
  FBoard.Data[0] := 3;
  FBoard.Data[1] := 2;
  FBoard.Data[2] := 1;
  done := False;
  myThread := TThread.CreateAnonymousThread(procedure
  begin
    FBoard.SortInsertion;
    done := True;
  end);
  myThread.FreeOnTerminate := True;
  myThread.Start;
  while not done do
    sleep(10);

  CheckEquals(1, FBoard.Data[0], 'Nieprawidłowa wartość danych w tabeli na idx = 0');
  CheckEquals(2, FBoard.Data[1], 'Nieprawidłowa wartość danych w tabeli na idx = 1');
  CheckEquals(3, FBoard.Data[2], 'Nieprawidłowa wartość danych w tabeli na idx = 2');
end;

procedure TestTBoard.TestSortQuick_321;
var
  myThread: TThread;
  done: Boolean;
begin
  // TODO: [TeamA] Sprawdzić sortowanie QuickSort na danych [3, 2, 1]
  // TODO: [TeamC] j.w.
  // TODO: [TeamD] j.w.
  FBoard.GenerateData(3);
  FBoard.Data[0] := 3;
  FBoard.Data[1] := 2;
  FBoard.Data[2] := 1;
  done := False;
  myThread := TThread.CreateAnonymousThread(procedure
  begin
    FBoard.SortQuick;
    done := True;
  end);
  myThread.FreeOnTerminate := True;
  myThread.Start;
  while not done do
    sleep(10);

  CheckEquals(1, FBoard.Data[0], 'Nieprawidłowa wartość danych w tabeli na idx = 0');
  CheckEquals(2, FBoard.Data[1], 'Nieprawidłowa wartość danych w tabeli na idx = 1');
  CheckEquals(3, FBoard.Data[2], 'Nieprawidłowa wartość danych w tabeli na idx = 2');
end;

initialization

RegisterTest(TestTBoard.Suite);

end.
