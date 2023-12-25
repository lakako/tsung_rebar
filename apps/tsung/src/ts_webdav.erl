%%%
%%%  Copyright © Nicolas Niclausse. 2008
%%%
%%%  Author : Nicolas Niclausse <nicolas@niclux.org>
%%%  Created: 12 mar 2008 by Nicolas Niclausse <nicolas@niclux.org>
%%%
%%%  This program is free software; you can redistribute it and/or modify
%%%  it under the terms of the GNU General Public License as published by
%%%  the Free Software Foundation; either version 2 of the License
%%%
%%%  This program is distributed in the hope that it will be useful,
%%%  but WITHOUT ANY WARRANTY; without even the implied warranty of
%%%  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%%%  GNU General Public License for more details.
%%%
%%%  You should have received a copy of the GNU General Public License
%%%  along with this program; if not, write to the Free Software
%%%  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307, USA.
%%%
%%%  In addition, as a special exception, you have the permission to
%%%  link the code of this program with any library released under
%%%  the EPL license and distribute linked combinations including
%%%  the two; the MPL (Mozilla Public License), which EPL (Erlang
%%%  Public License) is based on, is included in this exception.

-module(ts_webdav).
-vc('$Id: ts_webdav.erl,v 0.0 2008/03/12 12:47:07 nniclaus Exp $ ').
-author('nicolas.niclausse@niclux.org').

-behaviour(ts_plugin).

-include_lib("tsung_lib/include/ts_profile.hrl").
-include_lib("tsung_lib/include/ts_http.hrl").

-export([add_dynparams/4,
         get_message/2,
         session_defaults/0,
         parse/2,
         parse_bidi/2,
         dump/2,
         parse_config/2,
         decode_buffer/2,
         new_session/0]).

session_defaults() -> {ok, true}.
new_session() -> #http{}.

%% @spec decode_buffer(Buffer::binary(),Session::record(http)) ->  NewBuffer::binary()
%% @doc We need to decode buffer (remove chunks, decompress ...) for
%%      matching or dyn_variables
%% @end
decode_buffer(Buffer,Session) ->
    ts_http:decode_buffer(Buffer,Session).

%% we should implement methods defined in rfc4918

get_message(Req=#http_request{method=Method},#state_rcv{session=S})
  when Method == propfind;
       Method == proppatch;
       Method == copy;
       Method == move;
       Method == lock;
       Method == mkactivity;
       Method == unlock;
       Method == report;
       Method == 'version-control'
       ->
    M = string:to_upper(atom_to_list(Method)),
    {ts_http_common:http_body(M, Req),S};
get_message(Req=#http_request{method=Method},#state_rcv{session=S}) when Method == mkcol->
    {ts_http_common:http_no_body("MKCOL", Req), S};
get_message(Req,State) ->
    ts_http:get_message(Req,State).

parse_bidi(Data, State) ->
    ts_http:parse_bidi(Data,State).

dump(A,B) ->
    ts_http:dump(A,B).

parse(Data, State) ->
    ts_http_common:parse(Data, State).
parse_config(Element, Conf) ->
    ts_config_http:parse_config(Element, Conf).

add_dynparams(Subst, DynData, Param, HostData) ->
    ts_http:add_dynparams(Subst, DynData, Param, HostData).

%%% method PROPFIND; entetes: Depth (optional); body: XML
%%% method COPY; entete Destination: URL, If (optional), Overwrite (Optional), Depth; Body: XML (Optional)
%%% method MOVE; entete Destination: URL, If (optional), Overwrite (Optional), Depth; Body: XML (Optional)
%%% method PROPPATCH body: XML
%%% method MKCOL
%%% method LOCK; entete: Timeout (optional ?), If (Optional),Depth (Optional); Body: XML (optional ?)
%%% method UNLOCK; entete: Lock-Token; Body: XML (optional ?)
