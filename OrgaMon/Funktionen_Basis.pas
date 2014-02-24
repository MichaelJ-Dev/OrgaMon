{
  |������___                  __  __
  |�����/ _ \ _ __ __ _  __ _|  \/  | ___  _ __
  |����| | | | '__/ _` |/ _` | |\/| |/ _ \| '_ \
  |����| |_| | | | (_| | (_| | |  | | (_) | | | |
  |�����\___/|_|  \__, |\__,_|_|  |_|\___/|_| |_|
  |���������������|___/
  |
  |    Copyright (C) 2007  Andreas Filsinger
  |
  |    This program is free software: you can redistribute it and/or modify
  |    it under the terms of the GNU General Public License as published by
  |    the Free Software Foundation, either version 3 of the License, or
  |    (at your option) any later version.
  |
  |    This program is distributed in the hope that it will be useful,
  |    but WITHOUT ANY WARRANTY; without even the implied warranty of
  |    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  |    GNU General Public License for more details.
  |
  |    You should have received a copy of the GNU General Public License
  |    along with this program.  If not, see <http://www.gnu.org/licenses/>.
  |
  |    http://orgamon.org/
  |
}
unit Funktionen_Basis;

interface

uses
  Classes, gplists, globals,
  IB_Access, IB_Components;

{
  eBasis: Grundlegende Funktionen des OrgaMon ohne besondere Zuordnung zu

  eCommerce, eResource

}

// Grunds�tzliche Datenbank-Objekte
function nQuery: TIB_Query;
function nCursor: TIB_Cursor;
function nDSQL: TIB_DSQL;

{ Datenbank Abfragen allgemein }
function e_r_IsRID(FieldName: string; RID: integer): boolean;
// SQL selects, die einen Einzelnen Wert zur�ckgeben

function e_r_sql(s: string): integer; overload;
// Nur das erste Feld aus der ersten Zeile als Integer

function e_r_sql(s: string; sl: TStringList): integer; overload;
// Nur das erste Feld aus der Element als Text-Blob, result=1

function e_r_sqlt(s: string): TStringList;
// Nur das erste Feld des ersten Records als Text-Blob

function e_r_GEN(GenName: string): integer;

function e_w_GEN(GenName: string): integer;
// erh�ht den Generator erst um eins und liefert dann diesen neuen Wert.

// Zeit aus dem Datenbankserver lesen
function e_r_now: TdateTime;

//
function e_r_sqls(s: string): string;
function e_r_sqlb(s: string): boolean;
function e_r_sqld(s: string; ifnull: double = 0.0): double;

// Erste Ergebnis-Spalte als TStringList
function e_r_sqlsl(s: string): TStringList;

// wie sqlsl, jedoch noch den "RID" in der 2. Spalte
function e_r_sqlslo(s: string): TStringList;

// Alle numerischen Ergebnisse der ersten Spalte als Integer-Liste
function e_r_sqlm(s: string; m: TgpIntegerList = nil): TgpIntegerList;

function e_r_OLAP(OLAP: TStringList; Params: TStringList): TStringList;

// SQL Update, Execute Statements
procedure e_x_sql(s: string); overload;
procedure e_x_sql(s: TStrings); overload;
procedure e_x_update(s: string; sl: TStringList);
procedure e_w_dereference(RID: integer; TableN, FieldN: string;
  DeleteIt: boolean = false);

// Datenbank-Server Commit
procedure e_x_commit;

{ System }
function e_r_BasePlug: TStringList;
function e_r_Bearbeiter: integer; // [TReference]
function e_r_BearbeiterKuerzel(BEARBEITER_R: integer): string;
// Liefert das K�rzel des Bearbeiters.
//

{ System Ereignisse }
procedure e_w_EreignisAbschluss(EREIGNIS_R: integer; INFO: string = '');

{ Person }
procedure e_w_PersonSetPassword(PERSON_R: integer);
procedure e_w_PersonEnsurePassword(PERSON_R: integer);

{ Baustelle }
function e_r_ParameterFoto(sl: TStringList; p: string): string;
function e_r_BaustellenPfadFoto(Values: TStrings): String;
function e_r_BaustellenPfad(Values: TStrings): String;

function e_w_Medium: string;
procedure e_a_Infos(s: TStrings);
function cAusgabeArt_Aufnahme_MP3: TDOM_Reference;

{ Musiker }
function e_r_MusikerName(MUSIKER_R: integer): string;
function e_r_MusikerNachName(MUSIKER_R: integer): string;
function e_r_MusikerNurNachName(MUSIKER_R: integer): string;
function e_r_MusikerUeber(MUSIKER_R: integer): string;
function e_r_MusikerCache: TStringList;
function e_r_MusikerNachnamen: TStringList;
function e_r_MusikerGroup(MUSIKER_R: integer): TList;
function e_r_MusikerGroupRID(RID: integer): integer;
function e_r_MusikerWerke(MUSIKER_R: integer): TList;
procedure e_w_MusikerChangeRef(FROM_RID, TO_RID: string);
function e_w_MusikerCheckCreate(MusikerListe: string): integer;
procedure InvalidateCache_Musiker;

{ L�nder }
procedure InvalidateCache_Laender;
function e_r_LaenderRIDfromALT(ALT: string): integer;
function e_r_LaenderRIDfromISO(ISO: string): integer;
function e_r_LaenderISO(RID: integer): string;
function e_r_LaenderPost(RID: integer): string;
function e_r_LaenderInternational(RID: integer): string;
function e_r_LaenderOrtFormat(RID: integer): string;
function e_r_LaenderCache: TStringList;

function enCrypt_Hex(s: string): string;
function deCrypt_Hex(s: string): string;
procedure MigrateFrom(BringTo: integer);

function e_r_ServerTime: TdateTime;
// Server Uhrzeit auslesen!
//

function SysDBApassword: string;
//
//

function e_r_ConnectionCount: integer;

function ReadLongStr(BlockName: string; ArtikelInfo: TStringList;
  delimiter: char = #13): string;
// aus einem Memo-Feld einen Value lesen, der aber �ber
// mehrere Zeilen gehen kann.
// Wirtschafts und Lager Logik

{ Artikel }
function e_r_ArtikelPDF(ARTIKEL_R: integer): TStringList;

function MengeAbschreiben(var GesamtVolumen, AbschreibeMenge: integer): integer;
// Abgeschrieben
// --------------------------------------------------------------------------
//
// Eine Abschreibe-Menge wird an einem Volumen abgeschrieben. Es wird
// im Prinzip gerechnet:
//
// dec(GesamtVolumen,AbschreibeMenge);
//
// Folgende Besonderheiten
// Es kann nicht �ber das Gesamtvolumen hinaus abgeschrieben werden
// Es wird zur�ckgeliefert, was wirklich abgeschrieben werden konnte
// --------------------------------------------------------------------------

function HasFieldName(IBQ: TIB_Dataset; FieldName: string): boolean;
function EnsureSQL(s: string): string;

{$IFDEF CONSOLE}

const
  // Globale Datenbank-Elemente
  fbConnection: TIB_Connection = nil;
  fbTransaction: TIB_Transaction = nil;
  fbSession: TIB_Session = nil;

{$ENDIF}

implementation

uses
  Windows, SysUtils,
  DCPcrypt2, DCPblockciphers, DCPblowfish,

  math,
  anfix32, dbOrgaMon, SimplePassword,

  // wegen der Versionsnummern
  GHD_pngimage,
  UFlxMessages,
  JclBase,
{$IFNDEF CONSOLE}
  Datenbank,
  TPUMain,
  JvclVer,
{$ENDIF}
  idglobal,
  infozip,
  CCR.Exif.Consts,
  srvXMLRPC;

const
  CacheMusikerLiveTime = 2 * 60 * 60 * 1000; // 2 Stunden
  { Private-Deklarationen }
  { Cache Musiker }
  CacheMusikerBirth: dword = 0;
  CacheMusiker: TStringList = nil;
  CacheMusikerNachname: TStringList = nil;
  CacheMusikerNurNachname: TStringList = nil;

  { Cache Laender }
  CacheLaender: TStringList = nil;
  CacheLaenderFull: TStringList = nil;

  { Pwd Crypt }
  CryptKeyLength: integer = 0;

var
  CryptKey: array [0 .. 1023] of AnsiChar;

procedure EnsureCache_Musiker; forward;
procedure EnsureCache_Laender; forward;

function e_r_MusikerName(MUSIKER_R: integer): string;
var
  k: integer;
begin
  if (MUSIKER_R > 0) then
  begin
    EnsureCache_Musiker;
    k := CacheMusiker.indexofobject(TObject(MUSIKER_R));
    if (k <> -1) then
      result := CacheMusiker[k]
    else
      result := '?';
  end
  else
  begin
    result := '';
  end;
end;

function e_r_MusikerNachName(MUSIKER_R: integer): string;
var
  k: integer;
begin
  if (MUSIKER_R > 0) then
  begin
    EnsureCache_Musiker;
    k := CacheMusikerNachname.indexofobject(TObject(MUSIKER_R));
    if (k <> -1) then
      result := CacheMusikerNachname[k]
    else
      result := '?';
  end
  else
  begin
    result := '';
  end;
end;

function e_r_MusikerNurNachName(MUSIKER_R: integer): string;
var
  k: integer;
begin
  if (MUSIKER_R > 0) then
  begin
    EnsureCache_Musiker;
    k := CacheMusikerNurNachname.indexofobject(TObject(MUSIKER_R));
    if (k <> -1) then
      result := CacheMusikerNurNachname[k]
    else
      result := '?';
  end
  else
  begin
    result := '';
  end;
end;

procedure InvalidateCache_Musiker;
begin
  CacheMusikerBirth := 0;
  FreeAndNil(CacheMusiker);
  FreeAndNil(CacheMusikerNachname);
  FreeAndNil(CacheMusikerNurNachname);
end;

procedure EnsureCache_Musiker;
var
  cMUSIKER: TIB_Cursor;
  RID: integer;
  Kette: string;
  KetteNachname: string;
  KetteNurNachname: string;
  KettenStartL: TList;
  n: integer;

  function strValidate(s: string): string;
  begin
    result := StrFilter(cutblank(s), #13#10#9, true);
  end;

begin
  if frequently(CacheMusikerBirth, CacheMusikerLiveTime) then
  begin
    FreeAndNil(CacheMusiker);
    FreeAndNil(CacheMusikerNachname);
    FreeAndNil(CacheMusikerNurNachname);
    CacheMusiker := TStringList.create;
    CacheMusikerNachname := TStringList.create;
    CacheMusikerNurNachname := TStringList.create;
    cMUSIKER := nCursor;
    with cMUSIKER do
    begin
      // erster Druchlauf "Einzelmusiker"
      sql.add('select RID,VORNAME,NACHNAME,EVL_TRENNER');
      sql.add('from MUSIKER');
      sql.add('where MUSIKER_R is null');
      sql.add('order by NACHNAME');
      ApiFirst;
      while not(eof) do
      begin
        CacheMusiker.AddObject(strValidate(FieldByName('VORNAME').AsString + ' '
          + FieldByName('NACHNAME').AsString),
          TObject(FieldByName('RID').AsInteger));

        CacheMusikerNachname.AddObject
          (strValidate(FieldByName('NACHNAME').AsString + ', ' +
          FieldByName('VORNAME').AsString),
          TObject(FieldByName('RID').AsInteger));

        CacheMusikerNurNachname.AddObject
          (strValidate(FieldByName('NACHNAME').AsString),
          TObject(FieldByName('RID').AsInteger));

        ApiNext;
      end;

      KettenStartL := TList.create;
      // zweiter Durchlauf "Verkettungen"
      close;
      sql.clear;
      // das sind die Anfangs-Punkte der Musiker-Verkettungen
      // Bedingungen: MUSIKER_R hat einen Inhalt
      // auf diesen RID zeigt kein anderer!
      sql.add('select RID from MUSIKER where MUSIKER_R IS NOT NULL and RID NOT IN (select EVL_R from MUSIKER) order by RID');
      ApiFirst;
      while not(eof) do
      begin
        KettenStartL.add(TObject(FieldByName('RID').AsInteger));
        ApiNext;
      end;

      // Jetzt immer die Musiker zusammenstellen!
      // Listbox1.items.beginupdate;
      // Listbox1.items.clear;
      for n := 0 to pred(KettenStartL.count) do
      begin
        Kette := '';
        KetteNachname := '';
        KetteNurNachname := '';
        RID := integer(KettenStartL[n]);
        repeat
          close;
          sql.clear;
          sql.add('select MUSIKER_R,EVL_R,EVL_TRENNER from MUSIKER where RID=' +
            inttostr(RID));
          ApiFirst;
          Kette := cutblank(Kette + ' ' +
            e_r_MusikerName(FieldByName('MUSIKER_R').AsInteger) + ' ' +
            FieldByName('EVL_TRENNER').AsString);
          KetteNachname :=
            cutblank(KetteNachname + ' ' + e_r_MusikerNachName
            (FieldByName('MUSIKER_R').AsInteger) + ' ' +
            FieldByName('EVL_TRENNER').AsString);
          KetteNurNachname :=
            cutblank(KetteNurNachname + ' ' + e_r_MusikerNurNachName
            (FieldByName('MUSIKER_R').AsInteger) + ' ' +
            FieldByName('EVL_TRENNER').AsString);
          if FieldByName('EVL_R').IsNull then
            break
          else
            RID := FieldByName('EVL_R').AsInteger;
        until false;
        CacheMusiker.AddObject(Kette, KettenStartL[n]);
        CacheMusikerNachname.AddObject(KetteNachname, KettenStartL[n]);
        CacheMusikerNurNachname.AddObject(KetteNurNachname, KettenStartL[n]);
        // listbox1.items.addobject(Kette, KettenStartL[n]);
      end;
      // Listbox1.items.endupdate;
      KettenStartL.free;
    end;
    cMUSIKER.free;
  end;
end;

function e_w_Medium: string;
begin
  result := inttostrN(e_w_GEN('GEN_MEDIUM'), 8);
end;

procedure e_w_MusikerChangeRef(FROM_RID, TO_RID: string);
begin
  e_x_sql('update MUSIKER set EVL_R=NULL where EVL_R=' + FROM_RID);
  e_x_sql('update MUSIKER set MUSIKER_R=' + TO_RID + ' where (MUSIKER_R=' +
    FROM_RID + ') AND (RID<>' + TO_RID + ')');
  e_x_sql('update ARTIKEL set KOMPONIST_R=' + TO_RID + ' where KOMPONIST_R=' +
    FROM_RID);
  e_x_sql('update ARTIKEL set ARRANGEUR_R=' + TO_RID + ' where ARRANGEUR_R=' +
    FROM_RID);
end;

function e_r_MusikerUeber(MUSIKER_R: integer): string;
var
  txt: TStringList;

  procedure AddOne(RID: integer);
  var
    cMUSIKER: TIB_Cursor;
    OneTxt: TStringList;
  begin
    if (txt.count > 0) then
      if (txt[pred(txt.count)] <> '') then
        txt.add('');
    txt.add(e_r_MusikerName(RID));
    OneTxt := TStringList.create;
    cMUSIKER := nCursor;
    with cMUSIKER do
    begin
      sql.add('select UEBER_INFO from MUSIKER where RID=' + inttostr(RID));
      ApiFirst;
      FieldByName('UEBER_INFO').AssignTo(OneTxt);
    end;
    cMUSIKER.free;
    txt.addstrings(OneTxt);
    OneTxt.free;
  end;

var
  cREF: TIB_Cursor;
begin
  txt := TStringList.create;
  cREF := nCursor;
  with cREF do
  begin
    repeat
      sql.clear;
      sql.add('select MUSIKER_R,EVL_R from MUSIKER where RID=' +
        inttostr(MUSIKER_R));
      ApiFirst;
      if FieldByName('MUSIKER_R').IsNull then
        AddOne(MUSIKER_R)
      else
        AddOne(FieldByName('MUSIKER_R').AsInteger);
      MUSIKER_R := FieldByName('EVL_R').AsInteger;
      if (MUSIKER_R < 1) then
        break;
      close;
    until false;
  end;
  cREF.free;
  result := HugeSingleLine(txt);
  txt.free;
end;

function e_r_MusikerCache: TStringList;
begin
  EnsureCache_Musiker;
  result := CacheMusiker;
end;

function e_r_MusikerGroup(MUSIKER_R: integer): TList;
var
  cREF: TIB_Cursor;
begin
  result := TList.create;
  cREF := nCursor;
  with cREF do
  begin
    repeat
      sql.clear;
      sql.add('select MUSIKER_R,EVL_R from MUSIKER where RID=' +
        inttostr(MUSIKER_R));
      ApiFirst;
      if FieldByName('MUSIKER_R').IsNull then
        result.add(TObject(MUSIKER_R))
      else
        result.add(TObject(FieldByName('MUSIKER_R').AsInteger));
      MUSIKER_R := FieldByName('EVL_R').AsInteger;
      if (MUSIKER_R < 1) then
        break;
      close;
    until false;
  end;
  cREF.free;
end;

function e_r_MusikerWerke(MUSIKER_R: integer): TList;
var
  cARTIKEL: TIB_Cursor;
  cREF: TIB_Cursor;
  lRID: string;
begin
  result := TList.create;

  // Alle RIDs dieses MUSIKERs sammeln
  lRID := inttostr(MUSIKER_R);

  cREF := nCursor;
  with cREF do
  begin
    sql.add('select RID from MUSIKER where MUSIKER_R=' + lRID);
    ApiFirst;
    while not(eof) do
    begin
      lRID := lRID + ',' +
        inttostr(e_r_MusikerGroupRID(FieldByName('RID').AsInteger));
      ApiNext;
    end;
  end;
  cREF.free;

  //
  cARTIKEL := nCursor;
  with cARTIKEL do
  begin
    sql.add(' select distinct RID from ARTIKEL where');
    sql.add('   KOMPONIST_R IN (' + lRID + ') OR');
    sql.add('   ARRANGEUR_R IN (' + lRID + ')');
    ApiFirst;
    while not(eof) do
    begin
      result.add(TObject(FieldByName('RID').AsInteger));
      ApiNext;
    end;
  end;
  cARTIKEL.free;

end;

function e_r_now: TdateTime;
var
  cNOW: TIB_Cursor;
begin
  cNOW := nCursor;
  with cNOW do
  begin
    sql.add('select CURRENT_TIMESTAMP from RDB$DATABASE');
    ApiFirst;
    result := Fields[0].AsDateTime;
  end;
  cNOW.free;
end;

function e_r_MusikerGroupRID(RID: integer): integer;
var
  cREF: TIB_Cursor;
begin
  // der ersten Datensatz einer Liste ermitteln (sich zur�ckarteien)
  cREF := nCursor;
  with cREF do
  begin
    repeat
      sql.clear;
      sql.add('select RID from MUSIKER where EVL_R=' + inttostr(RID));
      ApiFirst;
      if eof then
        break
      else
        RID := FieldByName('RID').AsInteger;
      close;
    until false;
  end;
  cREF.free;
  result := RID;
end;

function e_r_MusikerNachnamen: TStringList;
begin
  EnsureCache_Musiker;
  result := CacheMusikerNachname;
end;

function e_w_MusikerCheckCreate(MusikerListe: string): integer;
var
  k: integer;
begin
  EnsureCache_Musiker;
  k := CacheMusiker.indexof(MusikerListe);
  if (k = -1) then
  begin
    result := succ(e_r_GEN('GEN_MUSIKER'));
    e_x_sql('insert into MUSIKER (RID,NACHNAME) values (0,' + '''' +
      MusikerListe + ''')');
    InvalidateCache_Musiker;
  end
  else
  begin
    result := integer(CacheMusiker.objects[k]);
  end;
end;

procedure InvalidateCache_Laender;
var
  n: integer;
begin
  if assigned(CacheLaender) then
  begin
    for n := 0 to pred(CacheLaender.count) do
      TStringList(CacheLaender.objects[n]).free;
    FreeAndNil(CacheLaender);

    for n := 0 to pred(CacheLaenderFull.count) do
      TStringList(CacheLaenderFull.objects[n]).free;
    FreeAndNil(CacheLaenderFull);
  end;
end;

var
  _AusgabeArt_Aufnahme_MP3: TDOM_Reference = cRID_Unset;

function cAusgabeArt_Aufnahme_MP3: TDOM_Reference;
begin
  if (_AusgabeArt_Aufnahme_MP3 = cRID_Unset) then
  begin
    _AusgabeArt_Aufnahme_MP3 :=
      e_r_sql('select RID from AUSGABEART where KUERZEL=''MP3''');
    if (_AusgabeArt_Aufnahme_MP3 < cRID_FirstValid) then
      _AusgabeArt_Aufnahme_MP3 := cRID_Impossible;
  end;
  result := _AusgabeArt_Aufnahme_MP3;
end;

procedure EnsureCache_Laender;
var
  cLAND: TIB_Cursor;

  function AddOne: TStringList;
  begin
    result := TStringList.create;
    with cLAND do
    begin
      { [0] }
      result.add(FieldByName('ISO_KURZZEICHEN').AsString);
      { [1] }
      result.add(FieldByName('KURZ_ALT').AsString);
      { [2] }
      result.add(FieldByName('ORT_FORMAT').AsString);
      if (result[2] = '') then
        result[2] := iOrtFormat;
      { [3] }
      result.add(FieldByName('INT_TEXT').AsString);
    end;
  end;

begin
  if not(assigned(CacheLaender)) then
  begin
    CacheLaender := TStringList.create;
    CacheLaenderFull := TStringList.create;

    cLAND := nCursor;
    with cLAND do
    begin
      sql.add('select');
      sql.add(' LAND.RID,');
      sql.add(' LAND.ARTIKEL_RELEVANT,');
      sql.add(' LAND.ISO_KURZZEICHEN,');
      sql.add(' LAND.KURZ_ALT,');
      sql.add(' LAND.ORT_FORMAT,');
      sql.add(' INTERNATIONALTEXT.INT_TEXT');
      sql.add('from');
      sql.add(' LAND');
      sql.add('left join');
      sql.add(' INTERNATIONALTEXT');
      sql.add('on');
      sql.add(' (INTERNATIONALTEXT.RID=LAND.INT_NAME_R) and');
      sql.add(' (INTERNATIONALTEXT.LAND_R=' + inttostr(iHeimatLand) + ')');
      ApiFirst;
      while not(eof) do
      begin
        if FieldByName('ARTIKEL_RELEVANT').AsString = 'Y' then
          CacheLaender.AddObject
            (inttostr(FieldByName('RID').AsInteger), AddOne);
        CacheLaenderFull.AddObject
          (inttostr(FieldByName('RID').AsInteger), AddOne);
        ApiNext;
      end;
    end;
    cLAND.free;
    CacheLaender.sort;
    CacheLaender.sorted := true;

    CacheLaenderFull.sort;
    CacheLaenderFull.sorted := true;
  end;
end;

function e_r_LaenderRIDfromALT(ALT: string): integer;
var
  n: integer;
begin
  result := cRID_NULL;
  EnsureCache_Laender;
  ALT := nextp(ALT, '-');
  for n := 0 to pred(CacheLaender.count) do
    if (TStringList(CacheLaender.objects[n])[1] = ALT) then
    begin
      result := strtoint(CacheLaender[n]);
      break;
    end;
end;

function e_r_LaenderRIDfromISO(ISO: string): integer;
var
  n: integer;
begin
  EnsureCache_Laender;
  for n := 0 to pred(CacheLaender.count) do
    if TStringList(CacheLaender.objects[n])[0] = ISO then
    begin
      result := strtoint(CacheLaender[n]);
      exit;
    end;
  result := -1;
end;

function e_r_LaenderInternational(RID: integer): string;
var
  k: integer;
begin
  EnsureCache_Laender;
  k := CacheLaenderFull.indexof(inttostr(RID));
  if (k <> -1) then
    result := TStringList(CacheLaenderFull.objects[k])[3]
  else
    result := inttostr(RID) + '?';
end;

function e_r_LaenderISO(RID: integer): string;
var
  k: integer;
begin
  EnsureCache_Laender;
  k := CacheLaenderFull.indexof(inttostr(RID));
  if (k <> -1) then
    result := TStringList(CacheLaenderFull.objects[k])[0]
  else
    result := inttostr(RID) + '?';
end;

function e_r_LaenderCache: TStringList;
var
  n: integer;
begin
  EnsureCache_Laender;
  result := TStringList.create;
  for n := 0 to pred(CacheLaender.count) do
    result.add(TStringList(CacheLaender.objects[n])[0]);
  result.sort;
end;

function e_r_LaenderPost(RID: integer): string;
var
  k: integer;
begin
  EnsureCache_Laender;
  k := CacheLaenderFull.indexof(inttostr(RID));
  if (k <> -1) then
    result := TStringList(CacheLaenderFull.objects[k])[1]
  else
    result := inttostr(RID) + '?';
end;

function e_r_LaenderOrtFormat(RID: integer): string;
var
  k: integer;
begin
  EnsureCache_Laender;
  k := CacheLaenderFull.indexof(inttostr(RID));
  if (k <> -1) then
    result := TStringList(CacheLaenderFull.objects[k])[2]
  else
    result := inttostr(RID) + '?';
end;

const
  CacheBasePlug: TStringList = nil;

procedure e_a_Infos(s: TStrings);
begin
  with s do
  begin
    add('Copyright=' + cOrgaMonCopyright);
    add('Datum=' + long2dateLocalized(DateGet));
    add('AktuellesDatum=' + DatumLocalized);
    add('AktuelleUhrzeit=' + Uhr);
    add('DatumLog=' + DatumLog);
    add('ZeitLog=' + Uhr8);
  end;
end;

function e_r_ParameterFoto(sl: TStringList; p: string): string;
begin
  result := sl.Values[p + cE_Postfix_Foto];
  if (result = '') then
    result := sl.Values[p];
end;

function e_r_BaustellenPfad(Values: TStrings): String;
begin
  result := Values.Values[cE_VERZEICHNIS];
  if (result = '') then
    result := Values.Values[cE_FTPUSER];
end;

function e_r_BaustellenPfadFoto(Values: TStrings): String;
begin
  repeat

    result := Values.Values[cE_VERZEICHNIS + cE_Postfix_Foto];
    if (result = '') then
      result := Values.Values[cE_FTPUSER + cE_Postfix_Foto]
    else
      break;

    result := Values.Values[cE_VERZEICHNIS];
    if (result = '') then
      result := Values.Values[cE_FTPUSER]
    else
      break;

  until true;
end;

function e_r_BasePlug: TStringList;
begin
  result := TStringList.create;
  if not(assigned(CacheBasePlug)) then
  begin
    CacheBasePlug := TStringList.create;
    with CacheBasePlug do
    begin
      // ==========================================================
      // ACHTUNG: geht auch �ber XML-RPC "BasePlug" raus!
      // ACHTUNG: Reihenfolge nicht ver�ndern, nur erweitern!
      // ==========================================================
      { 01 } add(cAppName);
{$IFDEF CONSOLE}
      { 02 } add('IBO Rev. ' + fbConnection.Version);
{$ELSE}
      { 02 } add('IBO Rev. ' + Datamoduledatenbank.IB_connection1.Version);
{$ENDIF}
      { 03 } add(gsIdProductName + ' Rev. ' + gsIdVersion);
      { 04 } add(iPDFPathPublicShop);
      { 05 } add(iMusicPathShop);
      { 06 } add(iHTMLPath);
      { 07 } add(iBildURL);
{$IFDEF CONSOLE}
      { 08 } AddObject(
        { } cServerFunctions_Meta_CallCount,
        { } TXMLRPC_Server.oMetaString);
{$ELSE}
      { 08 } add('TPicUpload Rev. ' + TPUMain.REV);
{$ENDIF}
      { 09 } add('TMS FlexCel Rev. ' + FlexCelVersion);
      { 10 } add('jcl Rev. ' + inttostr(JclVersionMajor) + '.' +
        inttostr(JclVersionMinor));
{$IFDEF CONSOLE}
      { 11 } add('jvcl Rev. N/A');
{$ELSE}
      { 11 } add('jvcl Rev. ' + JVCL_VERSIONSTRING);
{$ENDIF}
      { 12 } add(iShopArtikelBilderURL);
      { 13 } add('infozip Rev. ' + RevToStr(infozip_version) + ' ' +
        zip_Version);
      { 14 } add('infozip Rev. ' + RevToStr(infozip_version) + ' ' +
        unzip_Version);
      { 15 } add(
        { } 'srvXMLRPC Rev. ' +
        { } RevToStr(srvXMLRPC.Version) + '@' +
        { } ComputerName + ':' +
        { } iXMLRPCPort);
      { 16 } add('Synedit Rev. 2.0.7');
      { 17 } add(iDataBaseUser);
      { 18 } add(iDataBasePassword); // connect PWD
      { 19 } add(iDataBase_SYSDBA_pwd); // SYSDBA PWD
      { 20 } add(e_r_fbClientVersion); //
      { 21 } add('Portable Network Graphics Delphi ' +
        GHD_pngimage.LibraryVersion);
      { 22 } add(iDataBaseHost);
      { 23 } add(i_c_DataBaseFName);
{$IFDEF CONSOLE}
      { 24 } AddObject(
        { } cServerFunctions_Meta_UpTime,
        { } TXMLRPC_Server.oMetaString);
{$ELSE}
      { 24 } add('N/A');
{$ENDIF}
      { 25 } add('CCR.Exif Rev. ' + CCR.Exif.Consts.Version);
      { 26 } add(e_r_Kontext);
      { 27 } add(Betriebssystem);
    end;
  end;
  result.Assign(CacheBasePlug);
end;

function e_r_Bearbeiter: integer;
begin
  result := e_r_sql('select RID from BEARBEITER where UPPER(USERNAME)=''' +
    AnsiUpperCase(UserName) + '''');
end;

function e_r_BearbeiterKuerzel(BEARBEITER_R: integer): string;
begin
  result := e_r_sqls('select KUERZEL from BEARBEITER where RID=' +
    inttostr(BEARBEITER_R));
end;

var
  DCP_blowfish1: TDCP_Blowfish = nil;

function deCrypt_Hex(s: string): string;
begin
  if not(assigned(DCP_blowfish1)) then
    DCP_blowfish1 := TDCP_Blowfish.create(nil);
  with DCP_blowfish1 do
  begin
    Init(CryptKey, CryptKeyLength, nil);
    result := cutrblank(decryptstring(hexstr2bin(s)));
  end;
end;

function enCrypt_Hex(s: string): string;
begin
  if not(assigned(DCP_blowfish1)) then
    DCP_blowfish1 := TDCP_Blowfish.create(nil);
  with DCP_blowfish1 do
  begin
    Init(CryptKey, CryptKeyLength, nil);
    result := bin2hexstr(encryptstring(s + fill(' ', 16 - length(s))));
  end;
end;

function SysDBApassword: string;
var
  cEINSTELLUNGEN: TIB_Cursor;
  Settings: TStringList;
begin
  cEINSTELLUNGEN := nCursor;
  with cEINSTELLUNGEN do
  begin
    sql.add('select * from EINSTELLUNG');
    ApiFirst;
    Settings := TStringList.create;
    FieldByName('SETTINGS').AssignTo(Settings);
    result := Settings.Values[cSettings_SysdbaPAssword];
    if (result = '') then
      result := 'masterkey'
    else
      result := deCrypt_Hex(result);
    Settings.free;
  end;
  cEINSTELLUNGEN.free;
end;

function e_r_IsRID(FieldName: string; RID: integer): boolean;
begin
  result := false;
  repeat
    if (RID < cRID_FirstValid) then
      break;

    result := (e_r_sql('select count(RID) from ' + nextp(FieldName, '_',
      0) + ' where RID=' + inttostr(RID)) = 1);
  until true;
end;

function e_r_sqlt(s: string): TStringList;
var
  cSQL: TIB_Cursor;
begin
  result := TStringList.create;
  cSQL := nCursor;
  with cSQL do
  begin
    sql.add(s);
    ApiFirst;
    Fields[0].AssignTo(result);
  end;
  cSQL.free;
end;

function e_r_sqlsl(s: string): TStringList;
var
  cSQL: TIB_Cursor;
begin
  result := TStringList.create;
  cSQL := nCursor;
  with cSQL do
  begin
    sql.add(s);
    ApiFirst;
    while not(eof) do
    begin
      result.add(Fields[0].AsString);
      ApiNext;
    end;
  end;
  cSQL.free;
end;

function e_r_sqlslo(s: string): TStringList;
var
  cSQL: TIB_Cursor;
begin
  result := TStringList.create;
  cSQL := nCursor;
  with cSQL do
  begin
    sql.add(s);
    ApiFirst;
    while not(eof) do
    begin
      result.AddObject(Fields[0].AsString, Pointer(Fields[1].AsInteger));
      ApiNext;
    end;
  end;
  cSQL.free;
end;

function e_r_sqlm(s: string; m: TgpIntegerList = nil): TgpIntegerList;
var
  cSQL: TIB_Cursor;
begin
  if assigned(m) then
    result := m
  else
    result := TgpIntegerList.create;
  cSQL := nCursor;
  with cSQL do
  begin
    sql.add(s);
    ApiFirst;
    while not(eof) do
    begin
      result.add(Fields[0].AsInteger);
      ApiNext;
    end;
  end;
  cSQL.free;
end;

function e_r_sqls(s: string): string;
var
  cSQL: TIB_Cursor;
begin
  cSQL := nCursor;
  with cSQL do
  begin
    sql.add(s);
    ApiFirst;
    result := Fields[0].AsString;
  end;
  cSQL.free;
end;

function e_r_sqlb(s: string): boolean;
begin
  result := e_r_sqls(s) = cC_True;
end;

function e_r_sqld(s: string; ifnull: double = 0.0): double;
var
  cSQL: TIB_Cursor;
begin
  cSQL := nCursor;
  with cSQL do
  begin
    sql.add(s);
    ApiFirst;
    if eof then
      result := ifnull
    else
      result := Fields[0].AsDouble;
  end;
  cSQL.free;
end;

procedure e_w_dereference(RID: integer; TableN, FieldN: string;
  DeleteIt: boolean = false);
var
  sql: TStringList;
begin
  sql := TStringList.create;
  if DeleteIt then
  begin
    sql.add('delete from ' + TableN);
    sql.add('WHERE');
    sql.add(FieldN + '=' + inttostr(RID));
  end
  else
  begin
    sql.add('update');
    sql.add(TableN + ' set');
    sql.add(FieldN + ' = NULL');
    sql.add('WHERE');
    sql.add(FieldN + '=' + inttostr(RID));
  end;
  e_x_sql(sql);
  sql.free;
end;

procedure e_x_sql(s: string);
begin
  if DebugMode then
    AppendStringsToFile(s, DiagnosePath + 'wSQL-' + inttostr(DateGet) + '.txt',
      DatumUhr);
{$IFDEF CONSOLE}
  fbTransaction.ExecuteImmediate(s);
{$ELSE}
  Datamoduledatenbank.IB_Transaction_W.ExecuteImmediate(s);
{$ENDIF}
end;

procedure e_x_commit;
begin
{$IFDEF CONSOLE}
  // In der Konsolenanwendung haben wir nur *eine* Transaktion, ein commit war bisher
  // nicht notwendig
{$ELSE}
  Datamoduledatenbank.IB_Transaction_R.Commit;
{$ENDIF}
end;

procedure e_x_update(s: string; sl: TStringList);
var
  qUPDATE: TIB_Query;
begin
  qUPDATE := nQuery;
  with qUPDATE do
  begin
    sql.add(s);
    first;
    edit;
    Fields[0].Assign(sl);
    post;
  end;
  qUPDATE.free;
end;

procedure e_x_sql(s: TStrings);
begin
  e_x_sql(HugeSingleLine(s, #13#10));
end;

function e_r_GEN(GenName: string): integer;
begin
{$IFDEF CONSOLE}
  result := fbConnection.Gen_ID(GenName, 0);
{$ELSE}
  result := Datamoduledatenbank.IB_connection1.Gen_ID(GenName, 0);
{$ENDIF}
end;

function e_w_GEN(GenName: string): integer;
begin
{$IFDEF CONSOLE}
  result := fbConnection.Gen_ID(GenName, 1);
{$ELSE}
  result := Datamoduledatenbank.IB_connection1.Gen_ID(GenName, 1);
{$ENDIF}
end;

function e_r_sql(s: string): integer;
var
  cSQL: TIB_Cursor;
begin
  cSQL := nCursor;
  with cSQL do
  begin
    sql.add(s);
    ApiFirst;
    result := Fields[0].AsInteger;
  end;
  cSQL.free;
end;

function e_r_sql(s: string; sl: TStringList): integer;
var
  cSQL: TIB_Cursor;
begin
  result := 1;
  cSQL := nCursor;
  with cSQL do
  begin
    sql.add(s);
    ApiFirst;
    Fields[0].AssignTo(sl);
  end;
  cSQL.free;
end;

function e_r_OLAP(OLAP: TStringList; Params: TStringList): TStringList;
var
  ParameterL: TStringList;

  function ResolveParameter(s: string): string;
  var
    k, l: integer;
  begin
    //
    result := s;
    ersetze('$$', '��', result);
    repeat

      // Anfangsposition bestimmen
      k := pos('$', result);
      if k = 0 then
        break;

      // L�nge bestimmen
      l := min(k + 1, length(result));
      repeat
        if (l > length(result)) then
          break;
        if not(result[l] in ['a' .. 'z', 'A' .. 'Z', '0' .. '9', '_']) then
          break;
        inc(l);
      until false;

      // Nun austauschen
      ersetze(copy(result, k, l - k), ParameterL.Values[copy(result, k, l - k)
        ], result);

    until false;
    ersetze('��', '$', result);
  end;

var
  cOLAP: TIB_Cursor;
  OneLine: string;
  sSQL: string;
  n, k: integer;
  AutoMataState: integer;
  EmptyLine: boolean;
begin

  //
  // 12.12.2005
  // erste Anf�nge, den Kernel via OLAP Statements
  // variable zu halten. Die OLAP Ausf�hrungs-Funktion sollte
  // noch vollst�ndig in das eCommerce Modul verschoben werden.
  //
  result := TStringList.create;
  ParameterL := TStringList.create;
  ParameterL.addstrings(Params);
  AutoMataState := 0;
  for n := 0 to pred(OLAP.count) do
  begin

    OneLine := cutblank(OLAP[n]);
    EmptyLine := (OneLine = '');

    // remove comment
    k := pos('//', OneLine);
    if (k > 0) then
      OneLine := copy(OneLine, 1, pred(k));
    k := pos('--', OneLine);
    if (k > 0) then
      OneLine := copy(OneLine, 1, pred(k));

    case AutoMataState of
      0:
        begin
          if pos('select', OneLine) = 1 then
          begin
            sSQL := OneLine;
            AutoMataState := 1;
          end
          else
          begin
            if (OneLine <> '') then
              ParameterL.add(OneLine);
          end;
        end;
      1:
        begin
          if EmptyLine then
            break
          else
            sSQL := sSQL + ' ' + OneLine;
        end;
    end;
  end;

  cOLAP := nCursor;
  with cOLAP do
  begin
    sql.add(ResolveParameter(sSQL));
    ApiFirst;
    for n := 0 to pred(FieldCount) do
      result.add(Fields[n].FieldName + '=' + Fields[n].AsString);
  end;

  cOLAP.free;
  ParameterL.free;
end;

procedure MigrateFrom(BringTo: integer);
begin
  case BringTo of
    2000:
      begin
        // ShowMessage('Willkommen in der Rev. 2.000');
      end;
    7129:
      FileMove(MyProgramPath + 'favorites.xml',
        iOlapPath + cAuftragLupeFavoritenFName);
    7681:
      if not(iOLAPpublic) then
      begin
        CheckCreateDir(iOlapPath);
        FileMove(MyApplicationPath + 'OLAP\*', iOlapPath);
      end;
  end;
end;

function e_r_ServerTime: TdateTime;
var
  cTIME: TIB_Cursor;
begin
  cTIME := nCursor;
  with cTIME do
  begin
    sql.add('select CURRENT_TIMESTAMP from RDB$DATABASE');
    ApiFirst;
    result := Fields[0].AsDateTime;
  end;
  cTIME.free;
end;

function ReadLongStr(BlockName: string; ArtikelInfo: TStringList;
  delimiter: char = #13): string;
var
  MachineState: byte;
  n, k: integer;
begin
  result := '';
  MachineState := 0;
  for n := 0 to pred(ArtikelInfo.count) do
  begin
    case MachineState of
      0:
        begin
          k := pos(BlockName + '=', ArtikelInfo[n]);
          if (k = 1) then
          begin
            result := copy(ArtikelInfo[n], length(BlockName) + 2, MaxInt);
            MachineState := 1;
          end;
        end;
      1:
        begin
          k := pos('=', ArtikelInfo[n]);
          if (k = 0) or (k > 11) then
            result := result + delimiter + ArtikelInfo[n]
          else
            exit;
        end;
    end;
  end;
end;

function MengeAbschreiben(var GesamtVolumen, AbschreibeMenge: integer): integer;
// Abgeschrieben
var
  Verminderung: integer;
begin
  Verminderung := min(GesamtVolumen, AbschreibeMenge);
  dec(GesamtVolumen, Verminderung);
  dec(AbschreibeMenge, Verminderung);
  result := Verminderung;
end;

function HasFieldName(IBQ: TIB_Dataset; FieldName: string): boolean;
var
  n: integer;
begin
  result := false;
  with IBQ do
  begin
    for n := 0 to pred(FieldCount) do
      if (Fields[n].FieldName = FieldName) then
      begin
        result := true;
        break;
      end;
  end;
end;

function EnsureSQL(s: string): string;
begin
  result := s;
  ersetze('''', '''''', result);
end;

function nQuery: TIB_Query;
begin
{$IFDEF CONSOLE}
  result := TIB_Query.create(nil);
  with result do
  begin
    IB_Connection := fbConnection;
    IB_Session := fbSession;
  end;
{$ELSE}
  result := Datamoduledatenbank.nQuery;
{$ENDIF}
end;

function nCursor: TIB_Cursor;
begin
{$IFDEF CONSOLE}
  result := TIB_Cursor.create(nil);
  with result do
  begin
    IB_Connection := fbConnection;
    IB_Session := fbSession;
  end;
{$ELSE}
  result := Datamoduledatenbank.nCursor;
  result.IB_Transaction := Datamoduledatenbank.IB_Transaction_R;
{$ENDIF}
end;

function nDSQL: TIB_DSQL;
begin
{$IFDEF CONSOLE}
  result := TIB_DSQL.create(nil);
  with result do
  begin
    IB_Connection := fbConnection;
    IB_Session := fbSession;
  end;
{$ELSE}
  result := Datamoduledatenbank.nDSQL;
{$ENDIF}
end;

type
  eConnectionCountMethod = (eCCM_unchecked, eCCM_impossible,
    eCCM_MonitorTables);

const
  CCM: eConnectionCountMethod = eCCM_unchecked;

function e_r_ConnectionCount: integer;
begin
  if (CCM = eCCM_unchecked) then
  begin
    if (e_r_sql('SELECT' + ' count(RDB$RELATION_NAME) ' + 'FROM' +
      ' RDB$RELATIONS ' + 'WHERE' +
      ' (RDB$RELATION_NAME=''MON$ATTACHMENTS'')') = 1) then
      CCM := eCCM_MonitorTables
    else
      CCM := eCCM_impossible;
  end;

  if (CCM = eCCM_MonitorTables) then
    result := e_r_sql('select sum(MON$STATE) from MON$ATTACHMENTS')
  else
    result := 1;

end;

procedure e_w_PersonSetPassword(PERSON_R: integer);
begin
  e_x_sql('update PERSON set' +
    { } ' USER_PWD=''' + FindANewPassword + ''',' +
    { } ' USER_SALT=''' + FindANewPassword + '''' +
    { } ' where RID=' + inttostr(PERSON_R));
end;

procedure e_w_PersonEnsurePassword(PERSON_R: integer);
var
  pwd, salt: string;
begin

  // Salt sicherstellen
  salt := e_r_sqls('select USER_SALT from PERSON where RID=' +
    inttostr(PERSON_R));
  if (salt = '') then
    e_x_sql('update PERSON set USER_SALT=''' + FindANewPassword +
      ''' where RID=' + inttostr(PERSON_R));

  // Passwort sicherstellen
  pwd := e_r_sqls('select USER_PWD from PERSON where RID=' +
    inttostr(PERSON_R));
  if (pwd = '') then
    e_w_PersonSetPassword(PERSON_R);

end;

function e_r_ArtikelPDF(ARTIKEL_R: integer): TStringList;
var
  Numero: string;

  procedure AddPath(Path: string);
  var
    sDir: TStringList;
    n: integer;
  begin
    sDir := TStringList.create;
    dir(Path + Numero + '*' + cPDFExtension, sDir, false);
    for n := 0 to pred(sDir.count) do
      sDir[n] := Path + sDir[n];
    result.addstrings(sDir);
    sDir.free;
  end;

begin
  result := TStringList.create;
  Numero := e_r_sqls('SELECT NUMERO FROM ARTIKEL WHERE RID=' +
    inttostr(ARTIKEL_R));
  AddPath(iPDFPathApp);
  AddPath(iPDFPathPublicApp);
end;

procedure e_w_EreignisAbschluss(EREIGNIS_R: integer; INFO: string = '');
begin
  // das Ereignis abzeichnen
  if (INFO <> '') then
    e_x_sql(
      { } 'update EREIGNIS set' +
      { } ' BEARBEITER_R=' + inttostr(sBearbeiter) + ', ' +
      { } ' INFO=''' + INFO + ''' ' +
      { } 'where RID=' + inttostr(EREIGNIS_R))
  else
    e_x_sql(
      { } 'update EREIGNIS set' +
      { } ' BEARBEITER_R=' + inttostr(sBearbeiter) +
      { } 'where RID=' + inttostr(EREIGNIS_R))
end;

const
  cKey = 'anfisoft' + cApplicationName;

begin

  // Verschl�sselungs Namespace
  CryptKey := cKey;
  CryptKeyLength := length(cKey) * 8;

{$IFDEF CONSOLE}
  // Datenbank - Zugriffselemente erzeugen!
  fbSession := TIB_Session.create(nil);
  fbTransaction := TIB_Transaction.create(nil);
  fbConnection := TIB_Connection.create(nil);

  with fbSession do
  begin
    AllowDefaultConnection := true;
    AllowDefaultTransaction := true;
    DefaultConnection := fbConnection;
    StoreActive := false;
    UseCursor := false;
  end;

  with fbConnection do
  begin
    IB_Session := fbSession;
    CacheStatementHandles := false;
    DefaultTransaction := fbTransaction;
    SQLDialect := 3;
    ParameterOrder := poNew;
    CharSet := 'NONE';
  end;

  with fbTransaction do
  begin
    IB_Session := fbSession;
    IB_Connection := fbConnection;
    ServerAutoCommit := true;
    Isolation := tiCommitted;
    RecVersion := true;
    LockWait := true;
  end;

{$ENDIF}

end.