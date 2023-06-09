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
|_  =bowl:gall
+*  this     .
    default  ~(. (default-agent this %|) bowl)
++  on-init   on-init:default
++  on-save   !>(state)
++  on-load
  |=  old=vase
  ^-  (quip card _this)
  `this(state !<(state-0 old))
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card _this)
  ?>  =(our src):bowl
  ?+    mark  ~|(%invalid-poke (on-poke:default))
      %rkyv-action
    =/  act  !<(action vase)
    ?-    -.act
        %create
      =/  new-store  (~(put by store) key.act value.act)
      :_  this(store new-store)
      :~  [%give %fact ~[/store] %rkyv-result !>(new-store)]
          [%give %kick ~[/store] ~]
      ==
    ::
        %retrieve
      :_  this
      :~  [%give %fact ~[/store] %rkyv-result !>(value+(~(get by store) key.act))]
          [%give %kick ~[/store] ~]
      ==
    ::
        %update
      =/  new-store  (~(put by store) key.act value.act)
      :_  this(store new-store)
      :~  [%give %fact ~[/store] %rkyv-result !>(value+value.act)]
          [%give %kick ~[/store] ~]
      ==
    ::
        %destroy
      =/  new-store  (~(del by store) key.act)
      :_  this(store new-store)
      :~  [%give %fact ~[/store] %rkyv-result !>(delete+key.act)]
          [%give %kick ~[/store] ~]
      ==
    ==  ::  %rkyv-action
  ::
      %rkyv-batch
    =/  bat  !<(batch vase)
    ?-    -.bat
        %create-many
      ::  Insert a list of key-value pairs.
      =/  new-store  (~(uni by store) (~(gas by *^store) list:bat))
      :_  this(store new-store)
      :~  [%give %fact ~[/store] %rkyv-result !>(store+new-store)]
          [%give %kick ~[/store] ~]
      ==
    ::
        %retrieve-by-head
      |^
      =/  keys  (scan-keys store term:bat)
      :_  this
      :~  [%give %fact ~[/store] %rkyv-result !>(answer+keys)]
          [%give %kick ~[/store] ~]
      ==
      ++  scan-keys
        |=  [=^store =term]
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
      :_  this
      :~  [%give %fact ~[/store] %rkyv-result !>(values+values)]
          [%give %kick ~[/store] ~]
      ==
    ::
        %update-many
      =/  new-store  (~(uni by store) (~(gas by *^store) list:bat))
      :_  this(store new-store)
      :~  [%give %fact ~[/store] %rkyv-result !>(store+new-store)]
          [%give %kick ~[/store] ~]
      ==
    ==  ::  %rkyv-batch
  ==  ::  mark
::
++  on-peek
  |=  =(pole knot)
  ^-  (unit (unit cage))
  ?+  pole  ~|(%invalid-scry-path (on-peek:default pole))
    [%x %store ~]  ``noun+!>(store)
    [%x %key key=@ ~]  ``noun+!>((~(gut by store) key:pole %null))
    [%x %value value=@ ~]  ``rkyv-result+!>(values+(find-by-value store value:pole))
    [%x %value %txt value=@ ~]  ``noun+!>((find-by-value store value:pole))
  ==
++  on-arvo   on-arvo:default
++  on-watch
  |=  =(pole knot)
  ^-  (quip card _this)
  ?+    pole  ~|(%invalid-watch-path (on-watch:default pole))
      [%store ~]
    :_  this
    :~  [%give %fact ~ %rkyv-result !>(store+store)]
    ==
  ::
      [%key key=@ ~]
    :_  this
    :~  [%give %fact ~ %rkyv-result !>(value+(~(gut by store) key:pole %$))]
    ==
  ==
++  on-leave  on-leave:default
++  on-agent  on-agent:default
++  on-fail   on-fail:default
--
