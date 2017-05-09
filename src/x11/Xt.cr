module X11
  @[Link("Xt")]
  lib Xt
    SPECIFICATIONRELEASE = 6
    CACHENONE = 1
    CACHEALL = 2
    CACHEBYDISPLAY = 3
    CACHEREFCOUNT = 256
    SMDONTCHANGE = 5
    IMXEVENT = 1
    IMTIMER = 2
    IMALTERNATEINPUT = 4
    IMSIGNAL = 8
    VERSIONDONTCHECK = 0
    EXPOSECOMPRESSMULTIPLE = 2
    EXPOSECOMPRESSMAXIMAL = 3
    EXPOSEGRAPHICSEXPOSE = 16
    EXPOSEGRAPHICSEXPOSEMERGED = 32
    EXPOSENOEXPOSE = 64
    EXPOSENOREGION = 128
    TABLEREPLACE = 0
    TABLEAUGMENT = 1
    TABLEOVERRIDE = 2
    TABLEUNMERGE = 3
    MYANCESTOR = 0
    MYDESCENDANT = 1
    MYCOUSIN = 2
    MYSELF = 3
    UNRELATED = 4
    fun manage_children = XtManageChildren(x0 : WidgetList, x1 : Cardinal)
    struct X_WidgetRec
      core : CorePart
    end
    alias Widget = X_WidgetRec*
    alias WidgetList = Widget*
    struct X_CorePart
      self : Widget
      widget_class : WidgetClass
      parent : Widget
      xrm_name : XrmName
      being_destroyed : Boolean
      destroy_callbacks : CallbackList
      constraints : Pointer
      x : Position
      y : Position
      width : Dimension
      height : Dimension
      border_width : Dimension
      managed : Boolean
      sensitive : Boolean
      ancestor_sensitive : Boolean
      event_table : EventTable
      tm : TmRec
      accelerators : Translations
      border_pixel : Pixel
      border_pixmap : Pixmap
      popup_list : WidgetList
      num_popups : Cardinal
      name : String
      screen : Screen*
      colormap : Colormap
      window : Window
      depth : Cardinal
      background_pixel : Pixel
      background_pixmap : Pixmap
      visible : Boolean
      mapped_when_managed : Boolean
    end
    type CorePart = X_CorePart
    struct X_WidgetClassRec
      core_class : CoreClassPart
    end
    alias WidgetClass = X_WidgetClassRec*
    struct X_CoreClassPart
      superclass : WidgetClass
      class_name : String
      widget_size : Cardinal
      class_initialize : Proc
      class_part_initialize : WidgetClassProc
      class_inited : Enum
      initialize : InitProc
      initialize_hook : ArgsProc
      realize : RealizeProc
      actions : ActionList
      num_actions : Cardinal
      resources : ResourceList
      num_resources : Cardinal
      xrm_class : XrmClass
      compress_motion : Boolean
      compress_exposure : Enum
      compress_enterleave : Boolean
      visible_interest : Boolean
      destroy : WidgetProc
      resize : WidgetProc
      expose : ExposeProc
      set_values : SetValuesFunc
      set_values_hook : ArgsFunc
      set_values_almost : AlmostProc
      get_values_hook : ArgsProc
      accept_focus : AcceptFocusProc
      version : VersionType
      callback_private : Pointer
      tm_table : String
      query_geometry : GeometryHandler
      display_accelerator : StringProc
      extension : Pointer
    end
    type CoreClassPart = X_CoreClassPart
    alias String = LibC::Char*
    alias Cardinal = LibC::UInt
    alias Proc = ( -> Void)
    alias WidgetClassProc = (WidgetClass -> Void)
    alias Enum = UInt8
    struct X_CoreClassPartInitialize
      name : String
      value : ArgVal
    end
    alias ArgList = X_CoreClassPartInitialize*
    alias InitProc = (Widget, Widget, ArgList, Cardinal* -> Void)
    alias ArgVal = LibC::Long
    alias ArgsProc = (Widget, ArgList, Cardinal* -> Void)
    alias ValueMask = LibC::ULong
    struct XSetWindowAttributes
      background_pixmap : Pixmap
      background_pixel : LibC::ULong
      border_pixmap : Pixmap
      border_pixel : LibC::ULong
      bit_gravity : LibC::Int
      win_gravity : LibC::Int
      backing_store : LibC::Int
      backing_planes : LibC::ULong
      backing_pixel : LibC::ULong
      save_under : LibC::Int
      event_mask : LibC::Long
      do_not_propagate_mask : LibC::Long
      override_redirect : LibC::Int
      colormap : Colormap
      cursor : Cursor
    end
    alias RealizeProc = (Widget, ValueMask*, XSetWindowAttributes* -> Void)
    alias Xid = LibC::ULong
    alias Pixmap = Xid
    alias Colormap = Xid
    alias Cursor = Xid
    struct X_XtActionsRec
      string : String
      proc : ActionProc
    end
    alias ActionList = X_XtActionsRec*
    union X_XEvent
      type : LibC::Int
      xany : XAnyEvent
      xkey : XKeyEvent
      xbutton : XButtonEvent
      xmotion : XMotionEvent
      xcrossing : XCrossingEvent
      xfocus : XFocusChangeEvent
      xexpose : XExposeEvent
      xgraphicsexpose : XGraphicsExposeEvent
      xnoexpose : XNoExposeEvent
      xvisibility : XVisibilityEvent
      xcreatewindow : XCreateWindowEvent
      xdestroywindow : XDestroyWindowEvent
      xunmap : XUnmapEvent
      xmap : XMapEvent
      xmaprequest : XMapRequestEvent
      xreparent : XReparentEvent
      xconfigure : XConfigureEvent
      xgravity : XGravityEvent
      xresizerequest : XResizeRequestEvent
      xconfigurerequest : XConfigureRequestEvent
      xcirculate : XCirculateEvent
      xcirculaterequest : XCirculateRequestEvent
      xproperty : XPropertyEvent
      xselectionclear : XSelectionClearEvent
      xselectionrequest : XSelectionRequestEvent
      xselection : XSelectionEvent
      xcolormap : XColormapEvent
      xclient : XClientMessageEvent
      xmapping : XMappingEvent
      xerror : XErrorEvent
      xkeymap : XKeymapEvent
      xgeneric : XGenericEvent
      xcookie : XGenericEventCookie
      pad : LibC::Long[24]
    end
    type XEvent = X_XEvent
    alias ActionProc = (Widget, XEvent*, String*, Cardinal* -> Void)
    struct XAnyEvent
      type : LibC::Int
      serial : LibC::ULong
      send_event : LibC::Int
      display : Display
      window : Window
    end
    type Display = Void*
    alias Window = Xid
    struct XKeyEvent
      type : LibC::Int
      serial : LibC::ULong
      send_event : LibC::Int
      display : Display
      window : Window
      root : Window
      subwindow : Window
      time : Time
      x : LibC::Int
      y : LibC::Int
      x_root : LibC::Int
      y_root : LibC::Int
      state : LibC::UInt
      keycode : LibC::UInt
      same_screen : LibC::Int
    end
    alias Time = LibC::ULong
    struct XButtonEvent
      type : LibC::Int
      serial : LibC::ULong
      send_event : LibC::Int
      display : Display
      window : Window
      root : Window
      subwindow : Window
      time : Time
      x : LibC::Int
      y : LibC::Int
      x_root : LibC::Int
      y_root : LibC::Int
      state : LibC::UInt
      button : LibC::UInt
      same_screen : LibC::Int
    end
    struct XMotionEvent
      type : LibC::Int
      serial : LibC::ULong
      send_event : LibC::Int
      display : Display
      window : Window
      root : Window
      subwindow : Window
      time : Time
      x : LibC::Int
      y : LibC::Int
      x_root : LibC::Int
      y_root : LibC::Int
      state : LibC::UInt
      is_hint : LibC::Char
      same_screen : LibC::Int
    end
    struct XCrossingEvent
      type : LibC::Int
      serial : LibC::ULong
      send_event : LibC::Int
      display : Display
      window : Window
      root : Window
      subwindow : Window
      time : Time
      x : LibC::Int
      y : LibC::Int
      x_root : LibC::Int
      y_root : LibC::Int
      mode : LibC::Int
      detail : LibC::Int
      same_screen : LibC::Int
      focus : LibC::Int
      state : LibC::UInt
    end
    struct XFocusChangeEvent
      type : LibC::Int
      serial : LibC::ULong
      send_event : LibC::Int
      display : Display
      window : Window
      mode : LibC::Int
      detail : LibC::Int
    end
    struct XExposeEvent
      type : LibC::Int
      serial : LibC::ULong
      send_event : LibC::Int
      display : Display
      window : Window
      x : LibC::Int
      y : LibC::Int
      width : LibC::Int
      height : LibC::Int
      count : LibC::Int
    end
    struct XGraphicsExposeEvent
      type : LibC::Int
      serial : LibC::ULong
      send_event : LibC::Int
      display : Display
      drawable : Drawable
      x : LibC::Int
      y : LibC::Int
      width : LibC::Int
      height : LibC::Int
      count : LibC::Int
      major_code : LibC::Int
      minor_code : LibC::Int
    end
    alias Drawable = Xid
    struct XNoExposeEvent
      type : LibC::Int
      serial : LibC::ULong
      send_event : LibC::Int
      display : Display
      drawable : Drawable
      major_code : LibC::Int
      minor_code : LibC::Int
    end
    struct XVisibilityEvent
      type : LibC::Int
      serial : LibC::ULong
      send_event : LibC::Int
      display : Display
      window : Window
      state : LibC::Int
    end
    struct XCreateWindowEvent
      type : LibC::Int
      serial : LibC::ULong
      send_event : LibC::Int
      display : Display
      parent : Window
      window : Window
      x : LibC::Int
      y : LibC::Int
      width : LibC::Int
      height : LibC::Int
      border_width : LibC::Int
      override_redirect : LibC::Int
    end
    struct XDestroyWindowEvent
      type : LibC::Int
      serial : LibC::ULong
      send_event : LibC::Int
      display : Display
      event : Window
      window : Window
    end
    struct XUnmapEvent
      type : LibC::Int
      serial : LibC::ULong
      send_event : LibC::Int
      display : Display
      event : Window
      window : Window
      from_configure : LibC::Int
    end
    struct XMapEvent
      type : LibC::Int
      serial : LibC::ULong
      send_event : LibC::Int
      display : Display
      event : Window
      window : Window
      override_redirect : LibC::Int
    end
    struct XMapRequestEvent
      type : LibC::Int
      serial : LibC::ULong
      send_event : LibC::Int
      display : Display
      parent : Window
      window : Window
    end
    struct XReparentEvent
      type : LibC::Int
      serial : LibC::ULong
      send_event : LibC::Int
      display : Display
      event : Window
      window : Window
      parent : Window
      x : LibC::Int
      y : LibC::Int
      override_redirect : LibC::Int
    end
    struct XConfigureEvent
      type : LibC::Int
      serial : LibC::ULong
      send_event : LibC::Int
      display : Display
      event : Window
      window : Window
      x : LibC::Int
      y : LibC::Int
      width : LibC::Int
      height : LibC::Int
      border_width : LibC::Int
      above : Window
      override_redirect : LibC::Int
    end
    struct XGravityEvent
      type : LibC::Int
      serial : LibC::ULong
      send_event : LibC::Int
      display : Display
      event : Window
      window : Window
      x : LibC::Int
      y : LibC::Int
    end
    struct XResizeRequestEvent
      type : LibC::Int
      serial : LibC::ULong
      send_event : LibC::Int
      display : Display
      window : Window
      width : LibC::Int
      height : LibC::Int
    end
    struct XConfigureRequestEvent
      type : LibC::Int
      serial : LibC::ULong
      send_event : LibC::Int
      display : Display
      parent : Window
      window : Window
      x : LibC::Int
      y : LibC::Int
      width : LibC::Int
      height : LibC::Int
      border_width : LibC::Int
      above : Window
      detail : LibC::Int
      value_mask : LibC::ULong
    end
    struct XCirculateEvent
      type : LibC::Int
      serial : LibC::ULong
      send_event : LibC::Int
      display : Display
      event : Window
      window : Window
      place : LibC::Int
    end
    struct XCirculateRequestEvent
      type : LibC::Int
      serial : LibC::ULong
      send_event : LibC::Int
      display : Display
      parent : Window
      window : Window
      place : LibC::Int
    end
    struct XPropertyEvent
      type : LibC::Int
      serial : LibC::ULong
      send_event : LibC::Int
      display : Display
      window : Window
      atom : Atom
      time : Time
      state : LibC::Int
    end
    alias Atom = LibC::ULong
    struct XSelectionClearEvent
      type : LibC::Int
      serial : LibC::ULong
      send_event : LibC::Int
      display : Display
      window : Window
      selection : Atom
      time : Time
    end
    struct XSelectionRequestEvent
      type : LibC::Int
      serial : LibC::ULong
      send_event : LibC::Int
      display : Display
      owner : Window
      requestor : Window
      selection : Atom
      target : Atom
      property : Atom
      time : Time
    end
    struct XSelectionEvent
      type : LibC::Int
      serial : LibC::ULong
      send_event : LibC::Int
      display : Display
      requestor : Window
      selection : Atom
      target : Atom
      property : Atom
      time : Time
    end
    struct XColormapEvent
      type : LibC::Int
      serial : LibC::ULong
      send_event : LibC::Int
      display : Display
      window : Window
      colormap : Colormap
      new : LibC::Int
      state : LibC::Int
    end
    struct XClientMessageEvent
      type : LibC::Int
      serial : LibC::ULong
      send_event : LibC::Int
      display : Display
      window : Window
      message_type : Atom
      format : LibC::Int
      data : XClientMessageEventData
    end
    union XClientMessageEventData
      b : LibC::Char[20]
      s : LibC::Short[10]
      l : LibC::Long[5]
    end
    struct XMappingEvent
      type : LibC::Int
      serial : LibC::ULong
      send_event : LibC::Int
      display : Display
      window : Window
      request : LibC::Int
      first_keycode : LibC::Int
      count : LibC::Int
    end
    struct XErrorEvent
      type : LibC::Int
      display : Display
      resourceid : Xid
      serial : LibC::ULong
      error_code : UInt8
      request_code : UInt8
      minor_code : UInt8
    end
    struct XKeymapEvent
      type : LibC::Int
      serial : LibC::ULong
      send_event : LibC::Int
      display : Display
      window : Window
      key_vector : LibC::Char[32]
    end
    struct XGenericEvent
      type : LibC::Int
      serial : LibC::ULong
      send_event : LibC::Int
      display : Display
      extension : LibC::Int
      evtype : LibC::Int
    end
    struct XGenericEventCookie
      type : LibC::Int
      serial : LibC::ULong
      send_event : LibC::Int
      display : Display
      extension : LibC::Int
      evtype : LibC::Int
      cookie : LibC::UInt
      data : Void*
    end
    struct X_XtResource
      resource_name : String
      resource_class : String
      resource_type : String
      resource_size : Cardinal
      resource_offset : Cardinal
      default_type : String
      default_addr : Pointer
    end
    alias ResourceList = X_XtResource*
    alias Pointer = Void*
    alias XrmQuark = LibC::Int
    alias XrmClass = XrmQuark
    alias Boolean = LibC::Char
    alias WidgetProc = (Widget -> Void)
    type Region = Void*
    alias ExposeProc = (Widget, XEvent*, Region -> Void)
    alias SetValuesFunc = (Widget, Widget, Widget, ArgList, Cardinal* -> Boolean)
    alias ArgsFunc = (Widget, ArgList, Cardinal* -> Boolean)
    struct WidgetGeometry
      request_mode : GeometryMask
      x : Position
      y : Position
      width : Dimension
      height : Dimension
      border_width : Dimension
      sibling : Widget
      stack_mode : LibC::Int
    end
    alias AlmostProc = (Widget, Widget, WidgetGeometry*, WidgetGeometry* -> Void)
    alias GeometryMask = LibC::UInt
    alias Position = LibC::Short
    alias Dimension = LibC::UShort
    alias AcceptFocusProc = (Widget, Time* -> Boolean)
    alias VersionType = LibC::ULong
    enum GeometryResult
      GeometryYes = 0
      GeometryNo = 1
      GeometryAlmost = 2
      GeometryDone = 3
    end
    alias GeometryHandler = (Widget, WidgetGeometry*, WidgetGeometry* -> GeometryResult)
    alias StringProc = (Widget, String -> Void)
    alias XrmName = XrmQuark
    struct X_XtCallbackRec
      callback : CallbackProc
      closure : Pointer
    end
    alias CallbackList = X_XtCallbackRec*
    alias CallbackProc = (Widget, Pointer, Pointer -> Void)
    struct X_XtEventRec
      next : EventTable
      mask : EventMask
      proc : EventHandler
      closure : Pointer
      select : LibC::UInt
      has_type_specifier : LibC::UInt
      async : LibC::UInt
    end
    alias EventTable = X_XtEventRec*
    alias EventMask = LibC::ULong
    alias EventHandler = (Widget, Pointer, XEvent*, Boolean* -> Void)
    struct X_XtTmRec
      translations : Translations
      proc_table : BoundActions
      current_state : X_XtStateRec*
      last_event_time : LibC::ULong
    end
    type TmRec = X_XtTmRec
    struct X_TranslationData
      has_bindings : UInt8
      operation : UInt8
      num_state_trees : TmShortCard
      composers : X_TranslationData*[2]
      event_mask : EventMask
      state_tree_tbl : TmStateTree[1]
    end
    alias Translations = X_TranslationData*
    alias TmShortCard = LibC::UShort
    union X_TmStateTreeRec
      simple : TmSimpleStateTreeRec
      parse : TmParseStateTreeRec
      complex : TmComplexStateTreeRec
    end
    alias TmStateTree = X_TmStateTreeRec*
    struct X_TmSimpleStateTreeRec
      is_simple : LibC::UInt
      is_accelerator : LibC::UInt
      mapping_notify_interest : LibC::UInt
      ref_count : LibC::UInt
      num_branch_heads : TmShortCard
      num_quarks : TmShortCard
      unused : TmShortCard
      branch_head_tbl : TmBranchHeadRec*
      quark_tbl : XrmQuark*
    end
    type TmSimpleStateTreeRec = X_TmSimpleStateTreeRec
    struct X_TmBranchHeadRec
      is_simple : LibC::UInt
      has_actions : LibC::UInt
      has_cycles : LibC::UInt
      more : LibC::UInt
      type_index : TmShortCard
      mod_index : TmShortCard
    end
    type TmBranchHeadRec = X_TmBranchHeadRec
    struct X_TmParseStateTreeRec
      is_simple : LibC::UInt
      is_accelerator : LibC::UInt
      mapping_notify_interest : LibC::UInt
      is_stack_quarks : LibC::UInt
      is_stack_branch_heads : LibC::UInt
      is_stack_complex_branch_heads : LibC::UInt
      unused : LibC::UInt
      num_branch_heads : TmShortCard
      num_quarks : TmShortCard
      num_complex_branch_heads : TmShortCard
      branch_head_tbl : TmBranchHeadRec*
      quark_tbl : XrmQuark*
      complex_branch_head_tbl : StatePtr*
      branch_head_tbl_size : TmShortCard
      quark_tbl_size : TmShortCard
      complex_branch_head_tbl_size : TmShortCard
      head : StatePtr
    end
    type TmParseStateTreeRec = X_TmParseStateTreeRec
    struct X_XtStateRec
      is_cycle_start : LibC::UInt
      is_cycle_end : LibC::UInt
      type_index : TmShortCard
      mod_index : TmShortCard
      actions : ActionPtr
      next_level : StatePtr
    end
    alias StatePtr = X_XtStateRec*
    struct X_ActionsRec
      idx : LibC::Int
      params : String*
      num_params : Cardinal
      next : ActionPtr
    end
    alias ActionPtr = X_ActionsRec*
    struct X_TmComplexStateTreeRec
      is_simple : LibC::UInt
      is_accelerator : LibC::UInt
      mapping_notify_interest : LibC::UInt
      ref_count : LibC::UInt
      num_branch_heads : TmShortCard
      num_quarks : TmShortCard
      num_complex_branch_heads : TmShortCard
      branch_head_tbl : TmBranchHeadRec*
      quark_tbl : XrmQuark*
      complex_branch_head_tbl : StatePtr*
    end
    type TmComplexStateTreeRec = X_TmComplexStateTreeRec
    alias BoundActions = ActionProc*
    alias Pixel = LibC::ULong
    struct Screen
      ext_data : XExtData*
      display : X_XDisplay*
      root : Window
      width : LibC::Int
      height : LibC::Int
      mwidth : LibC::Int
      mheight : LibC::Int
      ndepths : LibC::Int
      depths : Depth*
      root_depth : LibC::Int
      root_visual : Visual*
      default_gc : Gc
      cmap : Colormap
      white_pixel : LibC::ULong
      black_pixel : LibC::ULong
      max_maps : LibC::Int
      min_maps : LibC::Int
      backing_store : LibC::Int
      save_unders : LibC::Int
      root_input_mask : LibC::Long
    end
    struct X_XExtData
      number : LibC::Int
      next : X_XExtData*
      free_private : (X_XExtData* -> LibC::Int)
      private_data : XPointer
    end
    type XExtData = X_XExtData
    alias XPointer = LibC::Char*
    alias X_XDisplay = Void
    struct Depth
      depth : LibC::Int
      nvisuals : LibC::Int
      visuals : Visual*
    end
    struct Visual
      ext_data : XExtData*
      visualid : VisualId
      class : LibC::Int
      red_mask : LibC::ULong
      green_mask : LibC::ULong
      blue_mask : LibC::ULong
      bits_per_rgb : LibC::Int
      map_entries : LibC::Int
    end
    alias VisualId = LibC::ULong
    type Gc = Void*
    fun manage_child = XtManageChild(x0 : Widget)
    fun unmanage_children = XtUnmanageChildren(x0 : WidgetList, x1 : Cardinal)
    fun unmanage_child = XtUnmanageChild(x0 : Widget)
    fun change_managed_set = XtChangeManagedSet(x0 : WidgetList, x1 : Cardinal, x2 : DoChangeProc, x3 : Pointer, x4 : WidgetList, x5 : Cardinal)
    alias DoChangeProc = (Widget, WidgetList, Cardinal*, WidgetList, Cardinal*, Pointer -> Void)
    Address = 0
    BaseOffset = 1
    Immediate = 2
    ResourceString = 3
    ResourceQuark = 4
    WidgetBaseOffset = 5
    ProcedureArg = 6
    ListHead = 0
    ListTail = 1
    CallbackNoList = 0
    CallbackHasNone = 1
    CallbackHasSome = 2
    GeometryYes = 0
    GeometryNo = 1
    GeometryAlmost = 2
    GeometryDone = 3
    GrabNone = 0
    GrabNonexclusive = 1
    GrabExclusive = 2
    fun convert_and_store = XtConvertAndStore(x0 : Widget, x1 : LibC::Char*, x2 : XrmValue*, x3 : LibC::Char*, x4 : XrmValue*) : Boolean
    struct XrmValue
      size : LibC::UInt
      addr : XPointer
    end
    fun call_converter = XtCallConverter(x0 : Display, x1 : TypeConverter, x2 : XrmValuePtr, x3 : Cardinal, x4 : XrmValuePtr, x5 : XrmValue*, x6 : CacheRef*) : Boolean
    alias TypeConverter = (Display, XrmValue*, Cardinal*, XrmValue*, XrmValue*, Pointer* -> Boolean)
    alias XrmValuePtr = XrmValue*
    alias Opaque = Pointer
    alias CacheRef = Opaque
    fun dispatch_event = XtDispatchEvent(x0 : XEvent*) : Boolean
    fun call_accept_focus = XtCallAcceptFocus(x0 : Widget, x1 : Time*) : Boolean
    fun peek_event = XtPeekEvent(x0 : XEvent*) : Boolean
    fun app_peek_event = XtAppPeekEvent(x0 : AppContext, x1 : XEvent*) : Boolean
    struct X_XtAppStruct
      next : AppContext
      process : ProcessContext
      destroy_callbacks : InternalCallbackList
      list : Display*
      timer_queue : TimerEventRec*
      work_queue : WorkProcRec*
      input_list : InputEvent**
      outstanding_queue : InputEvent*
      signal_queue : SignalEventRec*
      error_db : XrmDatabase
      error_msg_handler : ErrorMsgHandler
      warning_msg_handler : ErrorMsgHandler
      error_handler : ErrorHandler
      warning_handler : ErrorHandler
      action_table : Void*
      converter_table : ConverterTable
      selection_timeout : LibC::ULong
      fds : FdStruct
      count : LibC::Short
      max : LibC::Short
      last : LibC::Short
      input_count : LibC::Short
      input_max : LibC::Short
      sync : Boolean
      being_destroyed : Boolean
      error_inited : Boolean
      identify_windows : Boolean
      heap : Heap
      fallback_resources : String*
      action_hook_list : X_ActionHookRec*
      block_hook_list : X_BlockHookRec*
      destroy_list_size : LibC::Int
      destroy_count : LibC::Int
      dispatch_level : LibC::Int
      destroy_list : DestroyRec
      in_phase2_destroy : Widget
      lang_proc_rec : LangProcRec
      free_bindings : Void*
      display_name_tried : String
      dpy_destroy_list : Display*
      dpy_destroy_count : LibC::Int
      exit_flag : Boolean
      rebuild_fdlist : Boolean
      lock_info : LockPtr
      lock : ThreadAppProc
      unlock : ThreadAppProc
      yield_lock : ThreadAppYieldLockProc
      restore_lock : ThreadAppRestoreLockProc
      free_lock : ThreadAppProc
    end
    alias AppContext = X_XtAppStruct*
    struct X_ProcessContextRec
      default_app_context : AppContext
      app_context_list : AppContext
      global_converter_table : ConverterTable
      global_lang_proc_rec : LangProcRec
    end
    alias ProcessContext = X_ProcessContextRec*
    alias X_ConverterRec = Void
    alias ConverterTable = X_ConverterRec**
    struct X_LangProcRec
      proc : LanguageProc
      closure : Pointer
    end
    type LangProcRec = X_LangProcRec
    alias LanguageProc = (Display, String, Pointer -> String)
    struct InternalCallbackRec
      count : LibC::UShort
      is_padded : LibC::Char
      call_state : LibC::Char
      align_pad : LibC::UInt
    end
    alias InternalCallbackList = InternalCallbackRec*
    struct X_TimerEventRec
      te_timer_value : Timeval
      te_next : X_TimerEventRec*
      te_proc : TimerCallbackProc
      app : AppContext
      te_closure : Pointer
    end
    type TimerEventRec = X_TimerEventRec
    struct Timeval
      tv_sec : TimeT
      tv_usec : SusecondsT
    end
    alias X__Int64T = LibC::LongLong
    alias X__TimeT = X__Int64T
    alias TimeT = X__TimeT
    alias X__SusecondsT = LibC::Long
    alias SusecondsT = X__SusecondsT
    alias IntervalId = LibC::ULong
    alias TimerCallbackProc = (Pointer, IntervalId* -> Void)
    struct X_WorkProcRec
      proc : WorkProc
      closure : Pointer
      next : X_WorkProcRec*
      app : AppContext
    end
    type WorkProcRec = X_WorkProcRec
    alias WorkProc = (Pointer -> Boolean)
    struct X_InputEvent
      ie_proc : InputCallbackProc
      ie_closure : Pointer
      ie_next : X_InputEvent*
      ie_oq : X_InputEvent*
      app : AppContext
      ie_source : LibC::Int
      ie_condition : InputMask
    end
    type InputEvent = X_InputEvent
    alias InputId = LibC::ULong
    alias InputCallbackProc = (Pointer, LibC::Int*, InputId* -> Void)
    alias InputMask = LibC::ULong
    struct X_SignalEventRec
      se_proc : SignalCallbackProc
      se_closure : Pointer
      se_next : X_SignalEventRec*
      app : AppContext
      se_notice : Boolean
    end
    type SignalEventRec = X_SignalEventRec
    alias SignalId = LibC::ULong
    alias SignalCallbackProc = (Pointer, SignalId* -> Void)
    type XrmDatabase = Void*
    alias ErrorMsgHandler = (String, String, String, String, String*, Cardinal* -> Void)
    alias ErrorHandler = (String -> Void)
    struct FdStruct
      rmask : FdSet
      wmask : FdSet
      emask : FdSet
      nfds : LibC::Int
    end
    struct FdSet
      fds_bits : X__FdMask[32]
    end
    alias X__Uint32T = LibC::UInt
    alias Uint32T = X__Uint32T
    alias X__FdMask = Uint32T
    struct Heap
      start : LibC::Char*
      current : LibC::Char*
      bytes_remaining : LibC::Int
    end
    struct X_ActionHookRec
      next : X_ActionHookRec*
      app : AppContext
      proc : ActionHookProc
      closure : Pointer
    end
    alias ActionHookProc = (Widget, Pointer, String, XEvent*, String*, Cardinal* -> Void)
    struct X_BlockHookRec
      next : X_BlockHookRec*
      app : AppContext
      proc : BlockHookProc
      closure : Pointer
    end
    alias BlockHookProc = (Pointer -> Void)
    type DestroyRec = Void*
    type LockPtr = Void*
    alias ThreadAppProc = (AppContext -> Void)
    alias ThreadAppYieldLockProc = (AppContext, Boolean*, Boolean*, LibC::Int* -> Void)
    alias ThreadAppRestoreLockProc = (AppContext, LibC::Int, Boolean* -> Void)
    fun is_subclass = XtIsSubclass(x0 : Widget, x1 : WidgetClass) : Boolean
    fun is_object = XtIsObject(x0 : Widget) : Boolean
    fun is_managed = XtIsManaged(x0 : Widget) : Boolean
    fun is_realized = XtIsRealized(x0 : Widget) : Boolean
    fun is_sensitive = XtIsSensitive(x0 : Widget) : Boolean
    fun own_selection = XtOwnSelection(x0 : Widget, x1 : Atom, x2 : Time, x3 : ConvertSelectionProc, x4 : LoseSelectionProc, x5 : SelectionDoneProc) : Boolean
    alias ConvertSelectionProc = (Widget, Atom*, Atom*, Atom*, Pointer*, LibC::ULong*, LibC::Int* -> Boolean)
    alias LoseSelectionProc = (Widget, Atom* -> Void)
    alias SelectionDoneProc = (Widget, Atom*, Atom* -> Void)
    fun own_selection_incremental = XtOwnSelectionIncremental(x0 : Widget, x1 : Atom, x2 : Time, x3 : ConvertSelectionIncrProc, x4 : LoseSelectionIncrProc, x5 : SelectionDoneIncrProc, x6 : CancelConvertSelectionProc, x7 : Pointer) : Boolean
    alias RequestId = Pointer
    alias ConvertSelectionIncrProc = (Widget, Atom*, Atom*, Atom*, Pointer*, LibC::ULong*, LibC::Int*, LibC::ULong*, Pointer, RequestId* -> Boolean)
    alias LoseSelectionIncrProc = (Widget, Atom*, Pointer -> Void)
    alias SelectionDoneIncrProc = (Widget, Atom*, Atom*, RequestId*, Pointer -> Void)
    alias CancelConvertSelectionProc = (Widget, Atom*, Atom*, RequestId*, Pointer -> Void)
    fun make_resize_request = XtMakeResizeRequest(x0 : Widget, x1 : Dimension, x2 : Dimension, x3 : Dimension*, x4 : Dimension*) : GeometryResult
    fun translate_coords = XtTranslateCoords(x0 : Widget, x1 : Position, x2 : Position, x3 : Position*, x4 : Position*)
    fun get_keysym_table = XtGetKeysymTable(x0 : Display, x1 : KeyCode*, x2 : LibC::Int*) : KeySym*
    alias KeyCode = UInt8
    alias KeySym = Xid
    fun keysym_to_keycode_list = XtKeysymToKeycodeList(x0 : Display, x1 : KeySym, x2 : KeyCode**, x3 : Cardinal*)
    fun string_conversion_warning = XtStringConversionWarning(x0 : LibC::Char*, x1 : LibC::Char*)
    fun display_string_conversion_warning = XtDisplayStringConversionWarning(x0 : Display, x1 : LibC::Char*, x2 : LibC::Char*)
    fun app_add_converter = XtAppAddConverter(x0 : AppContext, x1 : LibC::Char*, x2 : LibC::Char*, x3 : Converter, x4 : ConvertArgList, x5 : Cardinal)
    alias Converter = (XrmValue*, Cardinal*, XrmValue*, XrmValue* -> Void)
    struct ConvertArgRec
      address_mode : AddressMode
      address_id : Pointer
      size : Cardinal
    end
    alias ConvertArgList = ConvertArgRec*
    enum AddressMode
      Address = 0
      BaseOffset = 1
      Immediate = 2
      ResourceString = 3
      ResourceQuark = 4
      WidgetBaseOffset = 5
      ProcedureArg = 6
    end
    fun add_converter = XtAddConverter(x0 : LibC::Char*, x1 : LibC::Char*, x2 : Converter, x3 : ConvertArgList, x4 : Cardinal)
    fun set_type_converter = XtSetTypeConverter(x0 : LibC::Char*, x1 : LibC::Char*, x2 : TypeConverter, x3 : ConvertArgList, x4 : Cardinal, x5 : CacheType, x6 : Destructor)
    alias CacheType = LibC::Int
    alias Destructor = (AppContext, XrmValue*, Pointer, XrmValue*, Cardinal* -> Void)
    fun app_set_type_converter = XtAppSetTypeConverter(x0 : AppContext, x1 : LibC::Char*, x2 : LibC::Char*, x3 : TypeConverter, x4 : ConvertArgList, x5 : Cardinal, x6 : CacheType, x7 : Destructor)
    fun convert = XtConvert(x0 : Widget, x1 : LibC::Char*, x2 : XrmValue*, x3 : LibC::Char*, x4 : XrmValue*)
    fun direct_convert = XtDirectConvert(x0 : Converter, x1 : XrmValuePtr, x2 : Cardinal, x3 : XrmValuePtr, x4 : XrmValue*)
    fun parse_translation_table = XtParseTranslationTable(x0 : LibC::Char*) : Translations
    fun parse_accelerator_table = XtParseAcceleratorTable(x0 : LibC::Char*) : Accelerators
    alias Accelerators = X_TranslationData*
    fun override_translations = XtOverrideTranslations(x0 : Widget, x1 : Translations)
    fun augment_translations = XtAugmentTranslations(x0 : Widget, x1 : Translations)
    fun install_accelerators = XtInstallAccelerators(x0 : Widget, x1 : Widget)
    fun install_all_accelerators = XtInstallAllAccelerators(x0 : Widget, x1 : Widget)
    fun uninstall_translations = XtUninstallTranslations(x0 : Widget)
    fun app_add_actions = XtAppAddActions(x0 : AppContext, x1 : ActionList, x2 : Cardinal)
    fun add_actions = XtAddActions(x0 : ActionList, x1 : Cardinal)
    fun app_add_action_hook = XtAppAddActionHook(x0 : AppContext, x1 : ActionHookProc, x2 : Pointer) : ActionHookId
    alias ActionHookId = Opaque
    fun remove_action_hook = XtRemoveActionHook(x0 : ActionHookId)
    fun get_action_list = XtGetActionList(x0 : WidgetClass, x1 : ActionList*, x2 : Cardinal*)
    fun call_action_proc = XtCallActionProc(x0 : Widget, x1 : LibC::Char*, x2 : XEvent*, x3 : String*, x4 : Cardinal)
    fun register_grab_action = XtRegisterGrabAction(x0 : ActionProc, x1 : Boolean, x2 : LibC::UInt, x3 : LibC::Int, x4 : LibC::Int)
    fun set_multi_click_time = XtSetMultiClickTime(x0 : Display, x1 : LibC::Int)
    fun get_multi_click_time = XtGetMultiClickTime(x0 : Display) : LibC::Int
    fun get_action_keysym = XtGetActionKeysym(x0 : XEvent*, x1 : Modifiers*) : KeySym
    alias Modifiers = LibC::UInt
    fun translate_keycode = XtTranslateKeycode(x0 : Display, x1 : KeyCode, x2 : Modifiers, x3 : Modifiers*, x4 : KeySym*)
    fun translate_key = XtTranslateKey(x0 : Display, x1 : KeyCode, x2 : Modifiers, x3 : Modifiers*, x4 : KeySym*)
    fun set_key_translator = XtSetKeyTranslator(x0 : Display, x1 : KeyProc)
    alias KeyProc = (Display, KeyCode, Modifiers, Modifiers*, KeySym* -> Void)
    fun register_case_converter = XtRegisterCaseConverter(x0 : Display, x1 : CaseProc, x2 : KeySym, x3 : KeySym)
    alias CaseProc = (Display, KeySym, KeySym*, KeySym* -> Void)
    fun convert_case = XtConvertCase(x0 : Display, x1 : KeySym, x2 : KeySym*, x3 : KeySym*)
    fun add_event_handler = XtAddEventHandler(x0 : Widget, x1 : EventMask, x2 : Boolean, x3 : EventHandler, x4 : Pointer)
    fun remove_event_handler = XtRemoveEventHandler(x0 : Widget, x1 : EventMask, x2 : Boolean, x3 : EventHandler, x4 : Pointer)
    fun add_raw_event_handler = XtAddRawEventHandler(x0 : Widget, x1 : EventMask, x2 : Boolean, x3 : EventHandler, x4 : Pointer)
    fun remove_raw_event_handler = XtRemoveRawEventHandler(x0 : Widget, x1 : EventMask, x2 : Boolean, x3 : EventHandler, x4 : Pointer)
    fun insert_event_handler = XtInsertEventHandler(x0 : Widget, x1 : EventMask, x2 : Boolean, x3 : EventHandler, x4 : Pointer, x5 : ListPosition)
    enum ListPosition
      ListHead = 0
      ListTail = 1
    end
    fun insert_raw_event_handler = XtInsertRawEventHandler(x0 : Widget, x1 : EventMask, x2 : Boolean, x3 : EventHandler, x4 : Pointer, x5 : ListPosition)
    fun set_event_dispatcher = XtSetEventDispatcher(x0 : Display, x1 : LibC::Int, x2 : EventDispatchProc) : EventDispatchProc
    alias EventDispatchProc = (XEvent* -> Boolean)
    fun dispatch_event_to_widget = XtDispatchEventToWidget(x0 : Widget, x1 : XEvent*) : Boolean
    fun insert_event_type_handler = XtInsertEventTypeHandler(x0 : Widget, x1 : LibC::Int, x2 : Pointer, x3 : EventHandler, x4 : Pointer, x5 : ListPosition)
    fun remove_event_type_handler = XtRemoveEventTypeHandler(x0 : Widget, x1 : LibC::Int, x2 : Pointer, x3 : EventHandler, x4 : Pointer)
    fun build_event_mask = XtBuildEventMask(x0 : Widget) : EventMask
    fun register_extension_selector = XtRegisterExtensionSelector(x0 : Display, x1 : LibC::Int, x2 : LibC::Int, x3 : ExtensionSelectProc, x4 : Pointer)
    alias ExtensionSelectProc = (Widget, LibC::Int*, Pointer*, LibC::Int, Pointer -> Void)
    fun add_grab = XtAddGrab(x0 : Widget, x1 : Boolean, x2 : Boolean)
    fun remove_grab = XtRemoveGrab(x0 : Widget)
    fun process_event = XtProcessEvent(x0 : InputMask)
    fun app_process_event = XtAppProcessEvent(x0 : AppContext, x1 : InputMask)
    fun main_loop = XtMainLoop
    fun app_main_loop = XtAppMainLoop(x0 : AppContext)
    fun add_exposure_to_region = XtAddExposureToRegion(x0 : XEvent*, x1 : Region)
    fun set_keyboard_focus = XtSetKeyboardFocus(x0 : Widget, x1 : Widget)
    fun get_keyboard_focus_widget = XtGetKeyboardFocusWidget(x0 : Widget) : Widget
    fun last_event_processed = XtLastEventProcessed(x0 : Display) : XEvent*
    fun last_timestamp_processed = XtLastTimestampProcessed(x0 : Display) : Time
    fun add_time_out = XtAddTimeOut(x0 : LibC::ULong, x1 : TimerCallbackProc, x2 : Pointer) : IntervalId
    fun app_add_time_out = XtAppAddTimeOut(x0 : AppContext, x1 : LibC::ULong, x2 : TimerCallbackProc, x3 : Pointer) : IntervalId
    fun remove_time_out = XtRemoveTimeOut(x0 : IntervalId)
    fun add_input = XtAddInput(x0 : LibC::Int, x1 : Pointer, x2 : InputCallbackProc, x3 : Pointer) : InputId
    fun app_add_input = XtAppAddInput(x0 : AppContext, x1 : LibC::Int, x2 : Pointer, x3 : InputCallbackProc, x4 : Pointer) : InputId
    fun remove_input = XtRemoveInput(x0 : InputId)
    fun add_signal = XtAddSignal(x0 : SignalCallbackProc, x1 : Pointer) : SignalId
    fun app_add_signal = XtAppAddSignal(x0 : AppContext, x1 : SignalCallbackProc, x2 : Pointer) : SignalId
    fun remove_signal = XtRemoveSignal(x0 : SignalId)
    fun notice_signal = XtNoticeSignal(x0 : SignalId)
    fun next_event = XtNextEvent(x0 : XEvent*)
    fun app_next_event = XtAppNextEvent(x0 : AppContext, x1 : XEvent*)
    fun pending = XtPending : Boolean
    fun app_pending = XtAppPending(x0 : AppContext) : InputMask
    fun app_add_block_hook = XtAppAddBlockHook(x0 : AppContext, x1 : BlockHookProc, x2 : Pointer) : BlockHookId
    alias BlockHookId = LibC::ULong
    fun remove_block_hook = XtRemoveBlockHook(x0 : BlockHookId)
    fun is_override_shell = XtIsOverrideShell(x0 : Widget) : Boolean
    fun is_vendor_shell = XtIsVendorShell(x0 : Widget) : Boolean
    fun is_transient_shell = XtIsTransientShell(x0 : Widget) : Boolean
    fun is_application_shell = XtIsApplicationShell(x0 : Widget) : Boolean
    fun is_session_shell = XtIsSessionShell(x0 : Widget) : Boolean
    fun realize_widget = XtRealizeWidget(x0 : Widget)
    fun unrealize_widget = XtUnrealizeWidget(x0 : Widget)
    fun destroy_widget = XtDestroyWidget(x0 : Widget)
    fun set_sensitive = XtSetSensitive(x0 : Widget, x1 : Boolean)
    fun set_mapped_when_managed = XtSetMappedWhenManaged(x0 : Widget, x1 : Boolean)
    fun name_to_widget = XtNameToWidget(x0 : Widget, x1 : LibC::Char*) : Widget
    fun window_to_widget = XtWindowToWidget(x0 : Display, x1 : Window) : Widget
    fun get_class_extension = XtGetClassExtension(x0 : WidgetClass, x1 : Cardinal, x2 : XrmQuark, x3 : LibC::Long, x4 : Cardinal) : Pointer
    fun merge_arg_lists = XtMergeArgLists(x0 : ArgList, x1 : Cardinal, x2 : ArgList, x3 : Cardinal) : ArgList
    fun va_create_args_list = XtVaCreateArgsList(x0 : Pointer, ...) : VarArgsList
    alias VarArgsList = Pointer
    fun display = XtDisplay(x0 : Widget) : Display
    fun display_of_object = XtDisplayOfObject(x0 : Widget) : Display
    fun screen = XtScreen(x0 : Widget) : Screen*
    fun screen_of_object = XtScreenOfObject(x0 : Widget) : Screen*
    fun window = XtWindow(x0 : Widget) : Window
    fun window_of_object = XtWindowOfObject(x0 : Widget) : Window
    fun name = XtName(x0 : Widget) : String
    fun superclass = XtSuperclass(x0 : Widget) : WidgetClass
    fun class = XtClass(x0 : Widget) : WidgetClass
    fun parent = XtParent(x0 : Widget) : Widget
    fun map_widget = XtMapWidget(x0 : Widget)
    fun unmap_widget = XtUnmapWidget(x0 : Widget)
    fun add_callback = XtAddCallback(x0 : Widget, x1 : LibC::Char*, x2 : CallbackProc, x3 : Pointer)
    fun remove_callback = XtRemoveCallback(x0 : Widget, x1 : LibC::Char*, x2 : CallbackProc, x3 : Pointer)
    fun add_callbacks = XtAddCallbacks(x0 : Widget, x1 : LibC::Char*, x2 : CallbackList)
    fun remove_callbacks = XtRemoveCallbacks(x0 : Widget, x1 : LibC::Char*, x2 : CallbackList)
    fun remove_all_callbacks = XtRemoveAllCallbacks(x0 : Widget, x1 : LibC::Char*)
    fun call_callbacks = XtCallCallbacks(x0 : Widget, x1 : LibC::Char*, x2 : Pointer)
    fun call_callback_list = XtCallCallbackList(x0 : Widget, x1 : CallbackList, x2 : Pointer)
    fun has_callbacks = XtHasCallbacks(x0 : Widget, x1 : LibC::Char*) : CallbackStatus
    enum CallbackStatus
      CallbackNoList = 0
      CallbackHasNone = 1
      CallbackHasSome = 2
    end
    fun make_geometry_request = XtMakeGeometryRequest(x0 : Widget, x1 : WidgetGeometry*, x2 : WidgetGeometry*) : GeometryResult
    fun query_geometry = XtQueryGeometry(x0 : Widget, x1 : WidgetGeometry*, x2 : WidgetGeometry*) : GeometryResult
    fun create_popup_shell = XtCreatePopupShell(x0 : LibC::Char*, x1 : WidgetClass, x2 : Widget, x3 : ArgList, x4 : Cardinal) : Widget
    fun va_create_popup_shell = XtVaCreatePopupShell(x0 : LibC::Char*, x1 : WidgetClass, x2 : Widget, ...) : Widget
    fun popup = XtPopup(x0 : Widget, x1 : GrabKind)
    enum GrabKind
      GrabNone = 0
      GrabNonexclusive = 1
      GrabExclusive = 2
    end
    fun popup_spring_loaded = XtPopupSpringLoaded(x0 : Widget)
    fun callback_none = XtCallbackNone(x0 : Widget, x1 : Pointer, x2 : Pointer)
    fun callback_nonexclusive = XtCallbackNonexclusive(x0 : Widget, x1 : Pointer, x2 : Pointer)
    fun callback_exclusive = XtCallbackExclusive(x0 : Widget, x1 : Pointer, x2 : Pointer)
    fun popdown = XtPopdown(x0 : Widget)
    fun callback_popdown = XtCallbackPopdown(x0 : Widget, x1 : Pointer, x2 : Pointer)
    fun menu_popup_action = XtMenuPopupAction(x0 : Widget, x1 : XEvent*, x2 : String*, x3 : Cardinal*)
    fun create_widget = XtCreateWidget(x0 : LibC::Char*, x1 : WidgetClass, x2 : Widget, x3 : ArgList, x4 : Cardinal) : Widget
    fun create_managed_widget = XtCreateManagedWidget(x0 : LibC::Char*, x1 : WidgetClass, x2 : Widget, x3 : ArgList, x4 : Cardinal) : Widget
    fun va_create_widget = XtVaCreateWidget(x0 : LibC::Char*, x1 : WidgetClass, x2 : Widget, ...) : Widget
    fun va_create_managed_widget = XtVaCreateManagedWidget(x0 : LibC::Char*, x1 : WidgetClass, x2 : Widget, ...) : Widget
    fun create_application_shell = XtCreateApplicationShell(x0 : LibC::Char*, x1 : WidgetClass, x2 : ArgList, x3 : Cardinal) : Widget
    fun app_create_shell = XtAppCreateShell(x0 : LibC::Char*, x1 : LibC::Char*, x2 : WidgetClass, x3 : Display, x4 : ArgList, x5 : Cardinal) : Widget
    fun va_app_create_shell = XtVaAppCreateShell(x0 : LibC::Char*, x1 : LibC::Char*, x2 : WidgetClass, x3 : Display, ...) : Widget
    fun toolkit_initialize = XtToolkitInitialize
    fun set_language_proc = XtSetLanguageProc(x0 : AppContext, x1 : LanguageProc, x2 : Pointer) : LanguageProc
    fun display_initialize = XtDisplayInitialize(x0 : AppContext, x1 : Display, x2 : LibC::Char*, x3 : LibC::Char*, x4 : XrmOptionDescRec*, x5 : Cardinal, x6 : LibC::Int*, x7 : LibC::Char**)
    struct XrmOptionDescRec
      option : LibC::Char*
      specifier : LibC::Char*
      arg_kind : XrmOptionKind
      value : XPointer
    end
    enum XrmOptionKind
      XrmoptionNoArg = 0
      XrmoptionIsArg = 1
      XrmoptionStickyArg = 2
      XrmoptionSepArg = 3
      XrmoptionResArg = 4
      XrmoptionSkipArg = 5
      XrmoptionSkipLine = 6
      XrmoptionSkipNArgs = 7
    end
    fun open_application = XtOpenApplication(x0 : AppContext*, x1 : LibC::Char*, x2 : XrmOptionDescList, x3 : Cardinal, x4 : LibC::Int*, x5 : String*, x6 : String*, x7 : WidgetClass, x8 : ArgList, x9 : Cardinal) : Widget
    alias XrmOptionDescList = XrmOptionDescRec*
    fun va_open_application = XtVaOpenApplication(x0 : AppContext*, x1 : LibC::Char*, x2 : XrmOptionDescList, x3 : Cardinal, x4 : LibC::Int*, x5 : String*, x6 : String*, x7 : WidgetClass, ...) : Widget
    fun app_initialize = XtAppInitialize(x0 : AppContext*, x1 : LibC::Char*, x2 : XrmOptionDescList, x3 : Cardinal, x4 : LibC::Int*, x5 : String*, x6 : String*, x7 : ArgList, x8 : Cardinal) : Widget
    fun va_app_initialize = XtVaAppInitialize(x0 : AppContext*, x1 : LibC::Char*, x2 : XrmOptionDescList, x3 : Cardinal, x4 : LibC::Int*, x5 : String*, x6 : String*, ...) : Widget
    fun initialize = XtInitialize(x0 : LibC::Char*, x1 : LibC::Char*, x2 : XrmOptionDescRec*, x3 : Cardinal, x4 : LibC::Int*, x5 : LibC::Char**) : Widget
    fun open_display = XtOpenDisplay(x0 : AppContext, x1 : LibC::Char*, x2 : LibC::Char*, x3 : LibC::Char*, x4 : XrmOptionDescRec*, x5 : Cardinal, x6 : LibC::Int*, x7 : LibC::Char**) : Display
    fun create_application_context = XtCreateApplicationContext : AppContext
    fun app_set_fallback_resources = XtAppSetFallbackResources(x0 : AppContext, x1 : String*)
    fun destroy_application_context = XtDestroyApplicationContext(x0 : AppContext)
    fun initialize_widget_class = XtInitializeWidgetClass(x0 : WidgetClass)
    fun widget_to_application_context = XtWidgetToApplicationContext(x0 : Widget) : AppContext
    fun display_to_application_context = XtDisplayToApplicationContext(x0 : Display) : AppContext
    fun database = XtDatabase(x0 : Display) : XrmDatabase
    fun screen_database = XtScreenDatabase(x0 : Screen*) : XrmDatabase
    fun close_display = XtCloseDisplay(x0 : Display)
    fun get_application_resources = XtGetApplicationResources(x0 : Widget, x1 : Pointer, x2 : ResourceList, x3 : Cardinal, x4 : ArgList, x5 : Cardinal)
    fun va_get_application_resources = XtVaGetApplicationResources(x0 : Widget, x1 : Pointer, x2 : ResourceList, x3 : Cardinal, ...)
    fun get_subresources = XtGetSubresources(x0 : Widget, x1 : Pointer, x2 : LibC::Char*, x3 : LibC::Char*, x4 : ResourceList, x5 : Cardinal, x6 : ArgList, x7 : Cardinal)
    fun va_get_subresources = XtVaGetSubresources(x0 : Widget, x1 : Pointer, x2 : LibC::Char*, x3 : LibC::Char*, x4 : ResourceList, x5 : Cardinal, ...)
    fun set_values = XtSetValues(x0 : Widget, x1 : ArgList, x2 : Cardinal)
    fun va_set_values = XtVaSetValues(x0 : Widget, ...)
    fun get_values = XtGetValues(x0 : Widget, x1 : ArgList, x2 : Cardinal)
    fun va_get_values = XtVaGetValues(x0 : Widget, ...)
    fun set_subvalues = XtSetSubvalues(x0 : Pointer, x1 : ResourceList, x2 : Cardinal, x3 : ArgList, x4 : Cardinal)
    fun va_set_subvalues = XtVaSetSubvalues(x0 : Pointer, x1 : ResourceList, x2 : Cardinal, ...)
    fun get_subvalues = XtGetSubvalues(x0 : Pointer, x1 : ResourceList, x2 : Cardinal, x3 : ArgList, x4 : Cardinal)
    fun va_get_subvalues = XtVaGetSubvalues(x0 : Pointer, x1 : ResourceList, x2 : Cardinal, ...)
    fun get_resource_list = XtGetResourceList(x0 : WidgetClass, x1 : ResourceList*, x2 : Cardinal*)
    fun get_constraint_resource_list = XtGetConstraintResourceList(x0 : WidgetClass, x1 : ResourceList*, x2 : Cardinal*)
    fun session_get_token = XtSessionGetToken(x0 : Widget) : CheckpointToken
    struct X_XtCheckpointTokenRec
      save_type : LibC::Int
      interact_style : LibC::Int
      shutdown : Boolean
      fast : Boolean
      cancel_shutdown : Boolean
      phase : LibC::Int
      interact_dialog_type : LibC::Int
      request_cancel : Boolean
      request_next_phase : Boolean
      save_success : Boolean
      type : LibC::Int
      widget : Widget
    end
    alias CheckpointToken = X_XtCheckpointTokenRec*
    fun session_return_token = XtSessionReturnToken(x0 : CheckpointToken)
    fun app_set_error_msg_handler = XtAppSetErrorMsgHandler(x0 : AppContext, x1 : ErrorMsgHandler) : ErrorMsgHandler
    fun set_error_msg_handler = XtSetErrorMsgHandler(x0 : ErrorMsgHandler)
    fun app_set_warning_msg_handler = XtAppSetWarningMsgHandler(x0 : AppContext, x1 : ErrorMsgHandler) : ErrorMsgHandler
    fun set_warning_msg_handler = XtSetWarningMsgHandler(x0 : ErrorMsgHandler)
    fun app_error_msg = XtAppErrorMsg(x0 : AppContext, x1 : LibC::Char*, x2 : LibC::Char*, x3 : LibC::Char*, x4 : LibC::Char*, x5 : String*, x6 : Cardinal*)
    fun error_msg = XtErrorMsg(x0 : LibC::Char*, x1 : LibC::Char*, x2 : LibC::Char*, x3 : LibC::Char*, x4 : String*, x5 : Cardinal*)
    fun app_warning_msg = XtAppWarningMsg(x0 : AppContext, x1 : LibC::Char*, x2 : LibC::Char*, x3 : LibC::Char*, x4 : LibC::Char*, x5 : String*, x6 : Cardinal*)
    fun warning_msg = XtWarningMsg(x0 : LibC::Char*, x1 : LibC::Char*, x2 : LibC::Char*, x3 : LibC::Char*, x4 : String*, x5 : Cardinal*)
    fun app_set_error_handler = XtAppSetErrorHandler(x0 : AppContext, x1 : ErrorHandler) : ErrorHandler
    fun set_error_handler = XtSetErrorHandler(x0 : ErrorHandler)
    fun app_set_warning_handler = XtAppSetWarningHandler(x0 : AppContext, x1 : ErrorHandler) : ErrorHandler
    fun set_warning_handler = XtSetWarningHandler(x0 : ErrorHandler)
    fun app_error = XtAppError(x0 : AppContext, x1 : LibC::Char*)
    fun error = XtError(x0 : LibC::Char*)
    fun app_warning = XtAppWarning(x0 : AppContext, x1 : LibC::Char*)
    fun warning = XtWarning(x0 : LibC::Char*)
    fun app_get_error_database = XtAppGetErrorDatabase(x0 : AppContext) : XrmDatabase*
    fun get_error_database = XtGetErrorDatabase : XrmDatabase*
    fun app_get_error_database_text = XtAppGetErrorDatabaseText(x0 : AppContext, x1 : LibC::Char*, x2 : LibC::Char*, x3 : LibC::Char*, x4 : LibC::Char*, x5 : String, x6 : LibC::Int, x7 : XrmDatabase)
    fun get_error_database_text = XtGetErrorDatabaseText(x0 : LibC::Char*, x1 : LibC::Char*, x2 : LibC::Char*, x3 : LibC::Char*, x4 : String, x5 : LibC::Int)
    fun malloc = XtMalloc(x0 : Cardinal) : LibC::Char*
    fun calloc = XtCalloc(x0 : Cardinal, x1 : Cardinal) : LibC::Char*
    fun realloc = XtRealloc(x0 : LibC::Char*, x1 : Cardinal) : LibC::Char*
    fun free = XtFree(x0 : LibC::Char*)
    fun asprintf = XtAsprintf(new_string : String*, format : LibC::Char*, ...) : Cardinal
    fun new_string = XtNewString(x0 : String) : String
    fun add_work_proc = XtAddWorkProc(x0 : WorkProc, x1 : Pointer) : WorkProcId
    alias WorkProcId = LibC::ULong
    fun app_add_work_proc = XtAppAddWorkProc(x0 : AppContext, x1 : WorkProc, x2 : Pointer) : WorkProcId
    fun remove_work_proc = XtRemoveWorkProc(x0 : WorkProcId)
    fun get_gc = XtGetGC(x0 : Widget, x1 : GcMask, x2 : XgcValues*) : Gc
    alias GcMask = LibC::ULong
    struct XgcValues
      function : LibC::Int
      plane_mask : LibC::ULong
      foreground : LibC::ULong
      background : LibC::ULong
      line_width : LibC::Int
      line_style : LibC::Int
      cap_style : LibC::Int
      join_style : LibC::Int
      fill_style : LibC::Int
      fill_rule : LibC::Int
      arc_mode : LibC::Int
      tile : Pixmap
      stipple : Pixmap
      ts_x_origin : LibC::Int
      ts_y_origin : LibC::Int
      font : Font
      subwindow_mode : LibC::Int
      graphics_exposures : LibC::Int
      clip_x_origin : LibC::Int
      clip_y_origin : LibC::Int
      clip_mask : Pixmap
      dash_offset : LibC::Int
      dashes : LibC::Char
    end
    alias Font = Xid
    fun allocate_gc = XtAllocateGC(x0 : Widget, x1 : Cardinal, x2 : GcMask, x3 : XgcValues*, x4 : GcMask, x5 : GcMask) : Gc
    fun destroy_gc = XtDestroyGC(x0 : Gc)
    fun release_gc = XtReleaseGC(x0 : Widget, x1 : Gc)
    fun app_release_cache_refs = XtAppReleaseCacheRefs(x0 : AppContext, x1 : CacheRef*)
    fun callback_release_cache_ref = XtCallbackReleaseCacheRef(x0 : Widget, x1 : Pointer, x2 : Pointer)
    fun callback_release_cache_ref_list = XtCallbackReleaseCacheRefList(x0 : Widget, x1 : Pointer, x2 : Pointer)
    fun set_wm_colormap_windows = XtSetWMColormapWindows(x0 : Widget, x1 : Widget*, x2 : Cardinal)
    fun find_file = XtFindFile(x0 : LibC::Char*, x1 : Substitution, x2 : Cardinal, x3 : FilePredicate) : String
    struct SubstitutionRec
      match : LibC::Char
      substitution : String
    end
    alias Substitution = SubstitutionRec*
    alias FilePredicate = (String -> Boolean)
    fun resolve_pathname = XtResolvePathname(x0 : Display, x1 : LibC::Char*, x2 : LibC::Char*, x3 : LibC::Char*, x4 : LibC::Char*, x5 : Substitution, x6 : Cardinal, x7 : FilePredicate) : String
    fun disown_selection = XtDisownSelection(x0 : Widget, x1 : Atom, x2 : Time)
    fun get_selection_value = XtGetSelectionValue(x0 : Widget, x1 : Atom, x2 : Atom, x3 : SelectionCallbackProc, x4 : Pointer, x5 : Time)
    alias SelectionCallbackProc = (Widget, Pointer, Atom*, Atom*, Pointer, LibC::ULong*, LibC::Int* -> Void)
    fun get_selection_values = XtGetSelectionValues(x0 : Widget, x1 : Atom, x2 : Atom*, x3 : LibC::Int, x4 : SelectionCallbackProc, x5 : Pointer*, x6 : Time)
    fun app_set_selection_timeout = XtAppSetSelectionTimeout(x0 : AppContext, x1 : LibC::ULong)
    fun set_selection_timeout = XtSetSelectionTimeout(x0 : LibC::ULong)
    fun app_get_selection_timeout = XtAppGetSelectionTimeout(x0 : AppContext) : LibC::ULong
    fun get_selection_timeout = XtGetSelectionTimeout : LibC::ULong
    fun get_selection_request = XtGetSelectionRequest(x0 : Widget, x1 : Atom, x2 : RequestId) : XSelectionRequestEvent*
    fun get_selection_value_incremental = XtGetSelectionValueIncremental(x0 : Widget, x1 : Atom, x2 : Atom, x3 : SelectionCallbackProc, x4 : Pointer, x5 : Time)
    fun get_selection_values_incremental = XtGetSelectionValuesIncremental(x0 : Widget, x1 : Atom, x2 : Atom*, x3 : LibC::Int, x4 : SelectionCallbackProc, x5 : Pointer*, x6 : Time)
    fun set_selection_parameters = XtSetSelectionParameters(x0 : Widget, x1 : Atom, x2 : Atom, x3 : Pointer, x4 : LibC::ULong, x5 : LibC::Int)
    fun get_selection_parameters = XtGetSelectionParameters(x0 : Widget, x1 : Atom, x2 : RequestId, x3 : Atom*, x4 : Pointer*, x5 : LibC::ULong*, x6 : LibC::Int*)
    fun create_selection_request = XtCreateSelectionRequest(x0 : Widget, x1 : Atom)
    fun send_selection_request = XtSendSelectionRequest(x0 : Widget, x1 : Atom, x2 : Time)
    fun cancel_selection_request = XtCancelSelectionRequest(x0 : Widget, x1 : Atom)
    fun reserve_property_atom = XtReservePropertyAtom(x0 : Widget) : Atom
    fun release_property_atom = XtReleasePropertyAtom(x0 : Widget, x1 : Atom)
    fun grab_key = XtGrabKey(x0 : Widget, x1 : KeyCode, x2 : Modifiers, x3 : Boolean, x4 : LibC::Int, x5 : LibC::Int)
    fun ungrab_key = XtUngrabKey(x0 : Widget, x1 : KeyCode, x2 : Modifiers)
    fun grab_keyboard = XtGrabKeyboard(x0 : Widget, x1 : Boolean, x2 : LibC::Int, x3 : LibC::Int, x4 : Time) : LibC::Int
    fun ungrab_keyboard = XtUngrabKeyboard(x0 : Widget, x1 : Time)
    fun grab_button = XtGrabButton(x0 : Widget, x1 : LibC::Int, x2 : Modifiers, x3 : Boolean, x4 : LibC::UInt, x5 : LibC::Int, x6 : LibC::Int, x7 : Window, x8 : Cursor)
    fun ungrab_button = XtUngrabButton(x0 : Widget, x1 : LibC::UInt, x2 : Modifiers)
    fun grab_pointer = XtGrabPointer(x0 : Widget, x1 : Boolean, x2 : LibC::UInt, x3 : LibC::Int, x4 : LibC::Int, x5 : Window, x6 : Cursor, x7 : Time) : LibC::Int
    fun ungrab_pointer = XtUngrabPointer(x0 : Widget, x1 : Time)
    fun get_application_name_and_class = XtGetApplicationNameAndClass(x0 : Display, x1 : String*, x2 : String*)
    fun register_drawable = XtRegisterDrawable(x0 : Display, x1 : Drawable, x2 : Widget)
    fun unregister_drawable = XtUnregisterDrawable(x0 : Display, x1 : Drawable)
    fun hooks_of_display = XtHooksOfDisplay(x0 : Display) : Widget
    fun get_displays = XtGetDisplays(x0 : AppContext, x1 : Display**, x2 : Cardinal*)
    fun toolkit_thread_initialize = XtToolkitThreadInitialize : Boolean
    fun app_set_exit_flag = XtAppSetExitFlag(x0 : AppContext)
    fun app_get_exit_flag = XtAppGetExitFlag(x0 : AppContext) : Boolean
    fun app_lock = XtAppLock(x0 : AppContext)
    fun app_unlock = XtAppUnlock(x0 : AppContext)
    fun cvt_string_to_accelerator_table = XtCvtStringToAcceleratorTable(x0 : Display, x1 : XrmValuePtr, x2 : Cardinal*, x3 : XrmValuePtr, x4 : XrmValuePtr, x5 : Pointer*) : Boolean
    fun cvt_string_to_atom = XtCvtStringToAtom(x0 : Display, x1 : XrmValuePtr, x2 : Cardinal*, x3 : XrmValuePtr, x4 : XrmValuePtr, x5 : Pointer*) : Boolean
    fun cvt_string_to_bool = XtCvtStringToBool(x0 : Display, x1 : XrmValuePtr, x2 : Cardinal*, x3 : XrmValuePtr, x4 : XrmValuePtr, x5 : Pointer*) : Boolean
    fun cvt_string_to_boolean = XtCvtStringToBoolean(x0 : Display, x1 : XrmValuePtr, x2 : Cardinal*, x3 : XrmValuePtr, x4 : XrmValuePtr, x5 : Pointer*) : Boolean
    fun cvt_string_to_command_arg_array = XtCvtStringToCommandArgArray(x0 : Display, x1 : XrmValuePtr, x2 : Cardinal*, x3 : XrmValuePtr, x4 : XrmValuePtr, x5 : Pointer*) : Boolean
    fun cvt_string_to_cursor = XtCvtStringToCursor(x0 : Display, x1 : XrmValuePtr, x2 : Cardinal*, x3 : XrmValuePtr, x4 : XrmValuePtr, x5 : Pointer*) : Boolean
    fun cvt_string_to_dimension = XtCvtStringToDimension(x0 : Display, x1 : XrmValuePtr, x2 : Cardinal*, x3 : XrmValuePtr, x4 : XrmValuePtr, x5 : Pointer*) : Boolean
    fun cvt_string_to_directory_string = XtCvtStringToDirectoryString(x0 : Display, x1 : XrmValuePtr, x2 : Cardinal*, x3 : XrmValuePtr, x4 : XrmValuePtr, x5 : Pointer*) : Boolean
    fun cvt_string_to_display = XtCvtStringToDisplay(x0 : Display, x1 : XrmValuePtr, x2 : Cardinal*, x3 : XrmValuePtr, x4 : XrmValuePtr, x5 : Pointer*) : Boolean
    fun cvt_string_to_file = XtCvtStringToFile(x0 : Display, x1 : XrmValuePtr, x2 : Cardinal*, x3 : XrmValuePtr, x4 : XrmValuePtr, x5 : Pointer*) : Boolean
    fun cvt_string_to_float = XtCvtStringToFloat(x0 : Display, x1 : XrmValuePtr, x2 : Cardinal*, x3 : XrmValuePtr, x4 : XrmValuePtr, x5 : Pointer*) : Boolean
    fun cvt_string_to_font = XtCvtStringToFont(x0 : Display, x1 : XrmValuePtr, x2 : Cardinal*, x3 : XrmValuePtr, x4 : XrmValuePtr, x5 : Pointer*) : Boolean
    fun cvt_string_to_font_set = XtCvtStringToFontSet(x0 : Display, x1 : XrmValuePtr, x2 : Cardinal*, x3 : XrmValuePtr, x4 : XrmValuePtr, x5 : Pointer*) : Boolean
    fun cvt_string_to_font_struct = XtCvtStringToFontStruct(x0 : Display, x1 : XrmValuePtr, x2 : Cardinal*, x3 : XrmValuePtr, x4 : XrmValuePtr, x5 : Pointer*) : Boolean
    fun cvt_string_to_gravity = XtCvtStringToGravity(x0 : Display, x1 : XrmValuePtr, x2 : Cardinal*, x3 : XrmValuePtr, x4 : XrmValuePtr, x5 : Pointer*) : Boolean
    fun cvt_string_to_initial_state = XtCvtStringToInitialState(x0 : Display, x1 : XrmValuePtr, x2 : Cardinal*, x3 : XrmValuePtr, x4 : XrmValuePtr, x5 : Pointer*) : Boolean
    fun cvt_string_to_int = XtCvtStringToInt(x0 : Display, x1 : XrmValuePtr, x2 : Cardinal*, x3 : XrmValuePtr, x4 : XrmValuePtr, x5 : Pointer*) : Boolean
    fun cvt_string_to_pixel = XtCvtStringToPixel(x0 : Display, x1 : XrmValuePtr, x2 : Cardinal*, x3 : XrmValuePtr, x4 : XrmValuePtr, x5 : Pointer*) : Boolean
    fun cvt_string_to_restart_style = XtCvtStringToRestartStyle(x0 : Display, x1 : XrmValuePtr, x2 : Cardinal*, x3 : XrmValuePtr, x4 : XrmValuePtr, x5 : Pointer*) : Boolean
    fun cvt_string_to_short = XtCvtStringToShort(x0 : Display, x1 : XrmValuePtr, x2 : Cardinal*, x3 : XrmValuePtr, x4 : XrmValuePtr, x5 : Pointer*) : Boolean
    fun cvt_string_to_translation_table = XtCvtStringToTranslationTable(x0 : Display, x1 : XrmValuePtr, x2 : Cardinal*, x3 : XrmValuePtr, x4 : XrmValuePtr, x5 : Pointer*) : Boolean
    fun cvt_string_to_unsigned_char = XtCvtStringToUnsignedChar(x0 : Display, x1 : XrmValuePtr, x2 : Cardinal*, x3 : XrmValuePtr, x4 : XrmValuePtr, x5 : Pointer*) : Boolean
    fun cvt_string_to_visual = XtCvtStringToVisual(x0 : Display, x1 : XrmValuePtr, x2 : Cardinal*, x3 : XrmValuePtr, x4 : XrmValuePtr, x5 : Pointer*) : Boolean
    fun cvt_int_to_bool = XtCvtIntToBool(x0 : Display, x1 : XrmValuePtr, x2 : Cardinal*, x3 : XrmValuePtr, x4 : XrmValuePtr, x5 : Pointer*) : Boolean
    fun cvt_int_to_boolean = XtCvtIntToBoolean(x0 : Display, x1 : XrmValuePtr, x2 : Cardinal*, x3 : XrmValuePtr, x4 : XrmValuePtr, x5 : Pointer*) : Boolean
    fun cvt_int_to_color = XtCvtIntToColor(x0 : Display, x1 : XrmValuePtr, x2 : Cardinal*, x3 : XrmValuePtr, x4 : XrmValuePtr, x5 : Pointer*) : Boolean
    fun cvt_int_to_float = XtCvtIntToFloat(x0 : Display, x1 : XrmValuePtr, x2 : Cardinal*, x3 : XrmValuePtr, x4 : XrmValuePtr, x5 : Pointer*) : Boolean
    fun cvt_int_to_font = XtCvtIntToFont(x0 : Display, x1 : XrmValuePtr, x2 : Cardinal*, x3 : XrmValuePtr, x4 : XrmValuePtr, x5 : Pointer*) : Boolean
    fun cvt_int_to_pixel = XtCvtIntToPixel(x0 : Display, x1 : XrmValuePtr, x2 : Cardinal*, x3 : XrmValuePtr, x4 : XrmValuePtr, x5 : Pointer*) : Boolean
    fun cvt_int_to_pixmap = XtCvtIntToPixmap(x0 : Display, x1 : XrmValuePtr, x2 : Cardinal*, x3 : XrmValuePtr, x4 : XrmValuePtr, x5 : Pointer*) : Boolean
    fun cvt_int_to_short = XtCvtIntToShort(x0 : Display, x1 : XrmValuePtr, x2 : Cardinal*, x3 : XrmValuePtr, x4 : XrmValuePtr, x5 : Pointer*) : Boolean
    fun cvt_int_to_unsigned_char = XtCvtIntToUnsignedChar(x0 : Display, x1 : XrmValuePtr, x2 : Cardinal*, x3 : XrmValuePtr, x4 : XrmValuePtr, x5 : Pointer*) : Boolean
    fun cvt_color_to_pixel = XtCvtColorToPixel(x0 : Display, x1 : XrmValuePtr, x2 : Cardinal*, x3 : XrmValuePtr, x4 : XrmValuePtr, x5 : Pointer*) : Boolean
    fun is_rect_obj = XtIsRectObj(x0 : Widget) : Boolean
    fun is_widget = XtIsWidget(x0 : Widget) : Boolean
    fun is_composite = XtIsComposite(x0 : Widget) : Boolean
    fun is_constraint = XtIsConstraint(x0 : Widget) : Boolean
    fun is_shell = XtIsShell(x0 : Widget) : Boolean
    fun is_wm_shell = XtIsWMShell(x0 : Widget) : Boolean
    fun is_top_level_shell = XtIsTopLevelShell(x0 : Widget) : Boolean
    fun create_window = XtCreateWindow(x0 : Widget, x1 : LibC::UInt, x2 : Visual*, x3 : ValueMask, x4 : XSetWindowAttributes*)
    fun resize_widget = XtResizeWidget(x0 : Widget, x1 : Dimension, x2 : Dimension, x3 : Dimension)
    fun move_widget = XtMoveWidget(x0 : Widget, x1 : Position, x2 : Position)
    fun configure_widget = XtConfigureWidget(x0 : Widget, x1 : Position, x2 : Position, x3 : Dimension, x4 : Dimension, x5 : Dimension)
    fun resize_window = XtResizeWindow(x0 : Widget)
    fun process_lock = XtProcessLock
    fun process_unlock = XtProcessUnlock
    NoServerGrab = 0
    PassiveServerGrab = 1
    ActiveServerGrab = 2
    PseudoPassiveServerGrab = 3
    PseudoActiveServerGrab = 4
    struct PerDisplayInputRec
      grab_list : GrabList
      keyboard : DeviceRec
      pointer : DeviceRec
      activating_key : KeyCode
      trace : Widget*
      trace_depth : LibC::Int
      trace_max : LibC::Int
      focus_widget : Widget
    end
    struct X_XtGrabRec
      next : GrabList
      widget : Widget
      exclusive : LibC::UInt
      spring_loaded : LibC::UInt
    end
    alias GrabList = X_XtGrabRec*
    struct X_XtDeviceRec
      grab : ServerGrabRec
      grab_type : ServerGrabType
    end
    type DeviceRec = X_XtDeviceRec
    struct X_XtServerGrabRec
      next : X_XtServerGrabRec*
      widget : Widget
      owner_events : LibC::UInt
      pointer_mode : LibC::UInt
      keyboard_mode : LibC::UInt
      has_ext : LibC::UInt
      confine_to_is_widget_win : LibC::UInt
      keybut : KeyCode
      modifiers : LibC::UShort
      event_mask : LibC::UShort
    end
    type ServerGrabRec = X_XtServerGrabRec
    enum ServerGrabType
      NoServerGrab = 0
      PassiveServerGrab = 1
      ActiveServerGrab = 2
      PseudoPassiveServerGrab = 3
      PseudoActiveServerGrab = 4
    end
    $app_peek_event_skip_timer = AppPeekEvent_SkipTimer : Boolean
    $strings = Strings : LibC::Char*
    $c_xt_toolkit_error = CXtToolkitError : String
  end
 end
