/-  *rkyv
/+  default-agent, dbug, *rkyv
|%
+$  versioned-state
  $%  state-0
  ==
+$  state-0
  $:  [%0 =store]
  ==
+$  card  card:agent:gall
--
%-  agent:dbug
=|  state-0
=*  state  -
^-  agent:gall
=<
|_  =bowl:gall
+*  this     .
    default  ~(. (default-agent this %|) bowl)
    eng      ~(. +> [bowl ~])
++  on-init
  =^  cards  state
    abet:init:eng
  [cards this]
++  on-save   !>(state)
++  on-load
  |=  =old=vase
  ^-  (quip card _this)
  =^  cards  state
    abet:(load:eng old-vase)
  [cards this]
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card _this)
  ?>  =(our src):bowl
  =^  cards  state  abet:(poke:eng mark vase)
  [cards this]
::
++  on-peek
  |=  =path
  ^-  (unit (unit cage))
  (peek:eng path)
++  on-arvo   on-arvo:default
++  on-watch
  |=  =path
  ^-  (quip card _this)
  =^  cards  state  abet:(watch:eng path)
  [cards this]
++  on-leave  on-leave:default
++  on-agent  on-agent:default
++  on-fail   on-fail:default
--
|_  [bol=bowl:gall deck=(list card)]
+*  that  .
++  emit  |=(=card that(deck [card deck]))
++  emil  |=(lack=(list card) that(deck (welp lack deck)))
++  abet
  ^-  (quip card _state)
  [(flop deck) state]
::
++  init
  ^+  that
  that
::
++  load
  |=  =vase
  ^+  that
  ?>  ?=([%0 *] q.vase)
  that(state !<(state-0 vase))
::
++  peek
  |=  =(pole knot)
  ^-  (unit (unit cage))
  ?+    pole  ~|(%invalid-scry-path !!)
    [%x %store ~]           ``rkyv-result+!>(store+store)
    [%x %key key=@ ~]       ``noun+!>((~(gut by store) key:pole %null))
    [%x %key key=@ %txt ~]  ``noun+!>(;;(cord +:(~(gut by store) key:pole [%$ %null])))
    [%x %value value=@ ~]   ``rkyv-result+!>(values+(find-by-value store value:pole))
  ==
::
++  watch
  |=  =(pole knot)
  ^+  that
  ?+    pole  ~|(%invalid-watch-path !!)
      [%store ~]
    =^  cards  state
      st-abet:(st-watch:(st-abed:st store))
    (emil cards)
  ::
      [%key key=@ ~]
    =^  cards  state
      st-abet:(st-watch-key:(st-abed:st store) key.pole)
    (emil cards)
  ==
::
++  poke
  |=  [=mark =vase]
  ^+  that
  =^  cards  state
   ?+    mark  ~|(%invalid-poke !!)
        %rkyv-action
      =/  act  !<(action vase)
      =*  do  st-abet:(st-poke-action:(st-abed:st store) act)
      ?-  -.act
        %create    do
        %retrieve  do
        %update    do
        %destroy   do
      ==
    ::
        %rkyv-batch
      =/  bat  !<(batch vase)
      =*  do  st-abet:(st-poke-batch:(st-abed:st store) bat)
      ?-  -.bat
        %create-many        do
        %retrieve-by-head   do
        %retrieve-by-value  do
        %update-many        do
      ==
    ==  ::  mark
  (emil cards)
::
++  st
  |_  $:  =^store
          caz=(list card)
      ==
  +*  st  .
  ++  st-emit  |=(c=card st(caz [c caz]))
  ++  st-emil  |=(lc=(list card) st(caz (welp lc caz)))
  ++  st-abed
    |=  [s=^^store]
    st(store s)
  ++  st-abet
    ^-  (quip card _state)
    [(flop caz) state(store store)]
  ++  st-watch
    |.  ::=  =(pole knot)
    ^+  st
    (st-emit [%give %fact ~ %rkyv-result !>(store+store)])
  ++  st-watch-key
    |=  =key
    ^+  st
    (st-emit [%give %fact ~ %rkyv-result !>(value+(~(gut by store) key %$))])
  ++  st-poke-action
    |=  act=action
    ^+  st
    ?-    -.act
        %create
      =.  store  (~(put by store) key.act value.act)
      =/  new-cards
        :~  [%give %fact ~[/store] %rkyv-result !>(store+store)]
            [%give %kick ~[/store] ~]
        ==
      (st-emil new-cards)
    ::
        %retrieve
      =/  new-cards
        :~  [%give %fact ~[/store] %rkyv-result !>(value+(~(get by store) key.act))]
            [%give %kick ~[/store] ~]
        ==
      (st-emil new-cards)
    ::
        %update
      =.  store  (~(put by store) key.act value.act)
      =/  new-cards
        :~  [%give %fact ~[/store] %rkyv-result !>(store+store)]
            [%give %kick ~[/store] ~]
        ==
      (st-emil new-cards)
    ::
        %destroy
      =/  new-cards
        :~  [%give %fact ~[/store] %rkyv-result !>(delete+key.act)]
            [%give %kick ~[/store] ~]
        ==
      =.  store  (~(del by store) key.act)
      (st-emil new-cards)
    ==  ::  %rkyv-action
  ++  st-poke-batch
    |=  bat=batch
    ^+  st
    ?-    -.bat
        %create-many
      ::  Insert a list of key-value pairs.
      =/  new-cards
        :~  [%give %fact ~[/store] %rkyv-result !>(store+store)]
            [%give %kick ~[/store] ~]
        ==
      =.  store  (~(uni by store) (~(gas by *^^store) list.bat))
      (st-emil new-cards)
    ::
        %retrieve-by-head
      |^
      =/  keys  (scan-keys store term:bat)
      =/  new-cards
        :~  [%give %fact ~[/store] %rkyv-result !>(answer+keys)]
            [%give %kick ~[/store] ~]
        ==
      (st-emil new-cards)
      ++  scan-keys
        |=  [=^^store =term]
        ^-  (set key)
        =/  term  (trip term)
        =/  keys  ~(tap in ~(key by store))
        =/  len  (lent term)
        =|  leys=(set key)
        |-
        ?~  keys  leys
        =/  ley  (scag len (trip i.keys))
        ?:  =(term ley)
          $(keys t.keys, leys (~(put in leys) `key`(crip ley)))
        $(keys t.keys)
      --
    ::
        %retrieve-by-value
      =/  values  (find-by-value store cord.bat)
      =/  new-cards
        :~  [%give %fact ~[/store] %rkyv-result !>(values+values)]
            [%give %kick ~[/store] ~]
        ==
      (st-emil new-cards)
    ::
        %update-many
      =/  new-cards
        :~  [%give %fact ~[/store] %rkyv-result !>(store+store)]
            [%give %kick ~[/store] ~]
        ==
      =.  store  (~(uni by store) (~(gas by store) list:bat))
      (st-emil new-cards)
    ==  ::  %rkyv-batch
  --
--
