;;;; -*- mode:lisp;coding:utf-8 -*-
;;;;**************************************************************************
;;;;FILE:               package.lisp
;;;;LANGUAGE:           Common-Lisp
;;;;SYSTEM:             Common-Lisp
;;;;USER-INTERFACE:     NONE
;;;;DESCRIPTION
;;;;    
;;;;    The MCLGUI package implements the Mac OS GUI classes of MCL
;;;;    over the OpenStep API.
;;;;    
;;;;AUTHORS
;;;;    <PJB> Pascal J. Bourguignon <pjb@informatimago.com>
;;;;MODIFICATIONS
;;;;    2012-05-09 <PJB> Created.
;;;;BUGS
;;;;LEGAL
;;;;    GPL3
;;;;    
;;;;    Copyright Pascal J. Bourguignon 2012 - 2012
;;;;    
;;;;    This program is free software: you can redistribute it and/or modify
;;;;    it under the terms of the GNU General Public License as published by
;;;;    the Free Software Foundation, either version 3 of the License, or
;;;;    (at your option) any later version.
;;;;    
;;;;    This program is distributed in the hope that it will be useful,
;;;;    but WITHOUT ANY WARRANTY; without even the implied warranty of
;;;;    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;;;    GNU General Public License for more details.
;;;;    
;;;;    You should have received a copy of the GNU General Public License
;;;;    along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;;;**************************************************************************


(defpackage "MCLGUI"
  (:use
   ;; "CL-STEPPER"
   "COMMON-LISP"
   "TRIVIAL-GRAY-STREAMS"
   "CLOSER-MOP")
  (:use "COM.INFORMATIMAGO.COMMON-LISP.LISP-SEXP.SOURCE-FORM"
        "COM.INFORMATIMAGO.CLEXT.CLOSER-WEAK")
  (:nicknames "UI")
  (:shadowing-import-from "CLOSER-MOP"
                          "STANDARD-CLASS" "STANDARD-METHOD" "STANDARD-GENERIC-FUNCTION"
                          "DEFMETHOD" "DEFGENERIC")
  (:import-from "COM.INFORMATIMAGO.OCLO"  "*NULL*" "NULLP")
  (:import-from "COM.INFORMATIMAGO.OBJCL" "YES" "NO")

  (:export ; debugging
   "NIY" "UIWARN" "FORMAT-TRACE")

  (:export

   ;; Extensions:
   
   "INITIALIZE"
   "COPY-OBJECT-FROM"

   "*TEXT-MODES*"

   "ON-MAIN-THREAD" "ON-MAIN-THREAD/SYNC")

  (:export
   "MAKE-RECT" "RECT-TOPLEFT" "RECT-BOTTOMRIGHT"
   "RECT-LEFT" "RECT-RIGHT" "RECT-TOP" "RECT-BOTTOM"
   "RECT-SIZE" "RECT-WIDTH" "RECT-HEIGHT"
   "EQUAL-RECT" "EMPTY-RECT-P" "RECT-CENTER" "OFFSET-RECT"
   "INSET-RECT" "INTERSECT-RECT" "UNION-RECT"
   "POINT-IN-RECT-P" "POINTS-TO-RECT" "POINT-TO-ANGLE"
   "PT2RECT")
  
  (:export
   
   ;; ----------------------------------------
   ;; Chapter 2: Points and Fonts
   ;; ----------------------------------------

   "MAKE-POINT" "POINT-STRING" "POINT-H" "POINT-V" "POINT<="
   "ADD-POINTS" "SUBTRACT-POINTS" "POINT-TO-LIST"
   
   
   "*FONT-LIST*" "*PEN-MODES*" "*STYLE-ALIST*"

   "*BLACK-PATTERN*" "*DARK-GRAY-PATTERN*" "*GRAY-PATTERN*"
   "*LIGHT-GRAY-PATTERN*" "*WHITE-PATTERN*"

   "*SCREEN-WIDTH*" "*SCREEN-HEIGHT*"
   "*PIXELS-PER-INCH-X*" "*PIXELS-PER-INCH-Y*"

   "*DEFAULT-FONT-SPEC*"
   "REAL-FONT" "FONT-SPEC" "STRING-WIDTH" "FONT-INFO"
   "FONT-CODES" "FONT-CODES-INFO" "FONT-CODES-LINE-HEIGHT"
   "FONT-CODES-STRING-WIDTH" "FONT-LINE-HEIGHT"
   "MERGE-FONT-CODES" "SYS-FONT-CODES"
   
   "VIEW-FONT" "SET-VIEW-FONT"
   "VIEW-FONT-CODES" "SET-VIEW-FONT-CODES"

   ;; Extension: conditions.
   
   "INVALID-VALUE-DESIGNATOR-ERROR" "INVALID-VALUE-ERROR"
   "INVALID-PEN-MODE-ERROR" "INVALID-PEN-MODE"
   "INVALID-PEN-MODE-VALUE-ERROR" "INVALID-PEN-MODE-VALUE"
   "INVALID-TRANSFER-MODE-ERROR" "INVALID-TRANSFER-MODE"
   "INVALID-TRANSFER-VALUE-ERROR" "INVALID-TRANSFER-MODE-VALUE"
   "INVALID-FONT-SPEC-ERROR" "INVALID-FONT-SPEC"
   "INVALID-FONT-SPEC-REASON" "INVALID-FONT-SPEC-OPTION"

   ;; Extension: the #@ reader macro is not installed automatically.
   "ENABLE-SHARP-AT-READER-MACRO"
   "DISABLE-SHARP-AT-READER-MACRO"

   ;; Not implemented:
   ;; grafport-write-string
   
   ;; ----------------------------------------
   ;; Chapter 3: Menus
   ;; ----------------------------------------

   "MENUBAR" "*MENUBAR*" "*MENUBAR-FROZEN*"
   "*DEFAULT-MENUBAR*" "*APPLE-MENU*"
   "*FILE-MENU*" "*EDIT-MENU*" "*LISP-MENU*" "*TOOLS-MENU*"
   "*WINDOWS-MENU*"  "SET-MENUBAR" "FIND-MENU" "DRAW-MENUBAR-IF"

   "MENU-ELEMENT" "MENU-ITEM-OWNER" "MENU-OWNER" "MENU-ITEM-TITLE"
   "MENU-TITLE" "MENU-ITEM-ENABLED-P" "MENU-ENABLED-P"
   "MENU-ITEM-STYLE" "MENU-STYLE" "MENU-UPDATE-FUNCTION"
   "MENU-ITEM-UPDATE-FUNCTION" "HELP-SPEC"

   "MENU" "MENU-ITEMS" "MENU-FONT" "SET-MENU-TITLE" "MENU-INSTALL"
   "MENU-DEINSTALL" "MENU-INSTALLED-P" "MENU-ENABLE" "MENU-DISABLE"
   "MENU-UPDATE"


   "ADD-MENU-ITEMS" "REMOVE-MENU-ITEMS" "FIND-MENU-ITEM"
   "COMMAND-KEY"

   "MENU-ALREADY-INSTALLED" "MENU-ALREADY-INSTALLED-ERROR" "MENU-ITEM"
   "MENU-ITEM-ACTION" "MENU-ITEM-ACTION-FUNCTION"
   
   "*BALLOT-BOX-WITH-CHECK*" "*CHECK-MARK*" "*HEAVY-CHECK-MARK*"
   "*NOT-CHECK-MARK*"

   "MENU-ITEM-CHECK-MARK" "MENU-ITEM-DISABLE" "MENU-ITEM-ENABLE"
   "MENU-ITEM-ICON-HANDLE" "MENU-ITEM-ICON-HANDLE-SLOT"
   "MENU-ITEM-ICON-NUM" "MENU-ITEM-ICON-NUM-SLOT" "MENU-ITEM-ICON-TYPE"
   "MENU-ITEM-ICON-TYPE-SLOT" "MENU-ITEM-NOT-OWNED"
   "MENU-ITEM-NOT-OWNED-ERROR" "MENU-ITEM-NOT-OWNED-ERROR-MENU"
   "MENU-ITEM-SCRIPT" "MENU-ITEM-SCRIPT-SLOT" "MENU-ITEM-UPDATE"

   "SET-COMMAND-KEY" "SET-MENU-ITEM-ACTION-FUNCTION"
   "SET-MENU-ITEM-CHECK-MARK" "SET-MENU-ITEM-ENABLED-P"
   "SET-MENU-ITEM-STYLE" "SET-MENU-ITEM-TITLE"
   "SET-MENU-ITEM-UPDATE-FUNCTION"

   
   "WITH-MENU-DETACHED"

   ;; Not implemented:
   ;; menu-handle menu-id *menu-id-object-alist*
   
   ;; Extensions:

   "MENU-ALREADY-INSTALLED-ERROR" "MENU-ALREADY-INSTALLED"
   "MENU-ITEM-NOT-OWNED-ERROR" "MENU-ITEM-NOT-OWNED-ERROR-MENU"
   "MENU-ITEM-NOT-OWNED"
   
   
   ;; ----------------------------------------
   ;; Chapter 4: Views and Windows
   ;; ----------------------------------------

   "SIMPLE-VIEW" "HELP-SPEC" "VIEW-CONTAINER" "VIEW-POSITION"
   "VIEW-SIZE" "VIEW-SCROLL-POSITION" "VIEW-NICK-NAME" "VIEW-FONT"
   "VIEW-SUBVIEWS"

   "VIEW" "VIEW-SUBVIEWS" "VIEW-VALID"
   "*CURRENT-VIEW*" "*CURRENT-FONT-VIEW*" "*MOUSE-VIEW*"

   
   
   "WINDOW" "WINDOW-CURSOR" "WINDOW-GROW-RECT" "WINDOW-DRAG-RECT"
   "WINDOW-COLOR-LIST" "WINDOW-DO-FIRST-CLICK"
   "WINDOW-OTHER-ATTRIBUTES" "WINDOW-ACTIVE-P" "WINDOW-ERASE-REGION"
   "WINDOW-INVALID-REGION" "WINDOW-PROCESS" "WINDOW-PROCESS-QUEUE"
   "WINDOW-TITLE" "WINDOW-VISIBLEP" "WINDOW-SHOWN-P" "WINDOW-COLORP"
   "WINDOW-CLOSE-BOX-P" "WINDOW-GROW-ICON-P" "WINDOW-THEME-BACKGROUND"
   "THEME-BACKGROUND" "WINDOW-PRIOR-THEME-DRAWING-STATE" "WINDOW-TYPE"
   "WINDOID"

   "*WINDOID-COUNT*" "*LAST-MOUSE-CLICK-WINDOW*"
   "*WINDOW-DEFAULT-POSITION*" "*WINDOW-DEFAULT-SIZE*"
   "*WINDOW-DEFAULT-ZOOM-POSITION*" "*WINDOW-DEFAULT-ZOOM-SIZE*"
   "*SELECTED-WINDOW*"

   "FOCUS-VIEW" "WITH-FOCUSED-VIEW" "WITH-FONT-FOCUSED-VIEW"
   "REFOCUS-VIEW" "INSTALL-VIEW-IN-WINDOW" "REMOVE-VIEW-FROM-WINDOW"
   "SET-VIEW-CONTAINER" "ADD-SUBVIEWS" "REMOVE-SUBVIEWS" "DO-SUBVIEWS"
   "MAP-SUBVIEWS" "SUBVIEWS" "VIEW-NAMED" "FIND-NAMED-SIBLING"
   "FIND-CLICKED-SUBVIEW" "VIEW-CORNERS" "VIEW-CORNERS"
   "INVALIDATE-REGION" "INVALIDATE-CORNERS" "INVALIDATE-VIEW"
   "VALIDATE-REGION" "VALIDATE-CORNERS" "VALIDATE-VIEW"
   "SET-VIEW-POSITION" "VIEW-DEFAULT-POSITION" "VIEW-DEFAULT-POSITION"
   "SET-VIEW-SIZE" "VIEW-DEFAULT-SIZE" "SET-VIEW-SCROLL-POSITION"
   "SET-VIEW-NICK-NAME" "VIEW-CONTAINS-POINT-P" "CONVERT-COORDINATES"
   "FIND-VIEW-CONTAINING-POINT" "POINT-IN-CLICK-REGION-P"
   "VIEW-ACTIVATE-EVENT-HANDLER" "VIEW-DEACTIVATE-EVENT-HANDLER"
   "VIEW-CLICK-EVENT-HANDLER" "VIEW-CONVERT-COORDINATES-AND-CLICK"
   "VIEW-DRAW-CONTENTS" "VIEW-FOCUS-AND-DRAW-CONTENTS" "VIEW-VALID-P"
   "VIEW-FONT-CODES" "SET-VIEW-FONT-CODES" "VIEW-FONT" "SET-VIEW-FONT"
   "VIEW-DEFAULT-FONT" "VIEW-FONT-CODES-INFO" "SET-INITIAL-VIEW-FONT"


   "VIEW-WINDOW" "WINDOWS" "FRONT-WINDOW" "TARGET" "MAP-WINDOWS"
   "FIND-WINDOW" "WINDOW-CLOSE" "CENTER-WINDOW" "SET-VIEW-POSITION"
   "SET-VIEW-SIZE" "WINDOW-SIZE-PARTS" "VIEW-DEFAULT-POSITION"
   "VIEW-DEFAULT-SIZE" "SET-WINDOW-TITLE" "SET-WINDOW-FILENAME" "SET-VIEW-FONT-CODES"
   "VIEW-DEFAULT-FONT" "WINDOW-SHOW" "WINDOW-HIDE"
   "WINDOW-ON-SCREEN-POSITION" "WINDOW-ON-SCREEN-SIZE"
   "WINDOW-ON-SCREEN-P" "WINDOW-ENSURE-ON-SCREEN" "WINDOW-LAYER"
   "SET-WINDOW-LAYER" "WINDOW-SELECT" "WINDOW-ZOOM-POSITION"
   "SET-WINDOW-ZOOM-POSITION" "WINDOW-DEFAULT-ZOOM-POSITION"
   "WINDOW-ZOOM-SIZE" "SET-WINDOW-ZOOM-SIZE" "WINDOW-DEFAULT-ZOOM-SIZE"


   "WINDOW-NEEDS-SAVING-P" "WINDOW-CAN-UNDO-P"
   "WINDOW-CAN-DO-OPERATION" "WINDOW-DO-OPERATION"
   "WINDOW-EVENT-HANDLER"
   
   "WINDOW-CLOSE" "WINDOW-SAVE" "WINDOW-SAVE-AS" "WINDOW-SAVE-COPY-AS"
   "WINDOW-REVERT" "WINDOW-HARDCOPY" "UNDO" "UNDO-MORE" "CUT" "COPY"
   "PASTE" "CLEAR" "SELECT-ALL" 
   
   
   ;; Extension (not exported/documented in MCL 4.1):
   "VIEW-GET" "VIEW-PUT" "VIEW-GET" "VIEW-REMPROP"
   "VIEW-CONTAINS-P"
   
   ;; Extension: condition:
   "VIEW-ERROR"
   "VIEW-ERROR-VIEW"

   ;; ----------------------------------------
   ;; Chapter 5: Dialog Items and Dialogs
   ;; ----------------------------------------

   ;; Dialog Items:
   
   "DIALOG-ITEM" "DIALOG-ITEM-WIDTH-CORRECTION" "DIALOG-ITEM-TEXT"
   "DIALOG-ITEM-ENABLED-P" "DIALOG-ITEM-ACTION-FUNCTION" "DIALOG-ITEMS"
   "MAKE-DIALOG-ITEM" "DIALOG-ITEM-ACTION"
   "SET-DIALOG-ITEM-ACTION-FUNCTION" "SET-DIALOG-ITEM-TEXT"
   "SET-DIALOG-ITEM-TEXT-FROM-DIALOG"
   "DIALOG-ITEM-ENABLE" "DIALOG-ITEM-DISABLE" "SET-DIALOG-ITEM-ENABLED-P"
   "WITH-FOCUSED-DIALOG-ITEM"

   ;; not implemented:
   ;; dialog-item-handle set-dialog-item-handle
   
   "BUTTON-DIALOG-ITEM" "PRESS-BUTTON" "DEFAULT-BUTTON-DIALOG-ITEM"
   "DEFAULT-BUTTON" "DEFAULT-BUTTON-P" "SET-DEFAULT-BUTTON"
   "DEFAULT-BUTTON-P"
  
   "KEY-HANDLER-MIXIN" "KEY-HANDLER-P" "ALLOW-RETURNS-P"
   "ALLOW-TABS-P" "EXIT-KEY-HANDLER" "ENTER-KEY-HANDLER"
   "SET-ALLOW-RETURNS" "SET-ALLOW-TABS"

   "STATIC-TEXT-DIALOG-ITEM"

   "EDITABLE-TEXT-DIALOG-ITEM"
   
   "BOX-DIALOG-ITEM"

   "CHECK-BOX-DIALOG-ITEM" "CHECK-BOX-CHECKED-P" "CHECK-BOX-CHECK"
   "CHECK-BOX-UNCHECK"

   "RADIO-BUTTON-DIALOG-ITEM" "RADIO-BUTTON-CLUSTER"
   "RADIO-BUTTON-PUSHED-P" "PUSHED-RADIO-BUTTON" "RADIO-BUTTON-PUSH"
   "RADIO-BUTTON-UNPUSH"

   "TABLE-DIALOG-ITEM" "CELL-CONTENTS" "REDRAW-CELL"
   "DRAW-CELL-CONTENTS" "HIGHLIGHT-TABLE-CELL" "TABLE-DIMENSIONS"
   "SET-TABLE-DIMENSIONS" "VISIBLE-DIMENSIONS" "SET-VISIBLE-DIMENSIONS"
   "CELL-SIZE" "SET-CELL-SIZE" "CELL-FONT" "SET-CELL-FONT" "CELL-SELECT"
   "CELL-DESELECT" "CELL-SELECTED-P" "SELECTED-CELLS" "SCROLL-POSITION"
   "SCROLL-TO-CELL" "CELL-POSITION" "POINT-TO-CELL" "TABLE-VSCROLLP"
   "TABLE-HSCROLLP" "TABLE-PRINT-FUNCTION"

   "POP-UP-MENU"

   ;; 5.1
   "SELECTED-ITEM" "POP-UP-MENU-ITEM-DISPLAY"
   "POP-UP-MENU-DEFAULT-ITEM" "SET-POP-UP-MENU-DEFAULT-ITEM"
   "POP-UP-MENU-AUTO-UPDATE-DEFAULT" "SET-POP-UP-ITEM-CHECK-MARK"
   "PULL-DOWN-MENU" "TYPEIN-MENU" "ACTION-POP-UP-MENU"
   "USE-POP-UP-CONTROL" "*USE-POP-UP-CONTROL*"

   
   "SCROLL-BAR-DIALOG-ITEM" "SCROLL-BAR-LENGTH"
   "SET-SCROLL-BAR-LENGTH" "SCROLL-BAR-MAX" "SCROLL-BAR-MIN"
   "SET-SCROLL-BAR-MAX" "SET-SCROLL-BAR-MIN" "SCROLL-BAR-SCROLL-SIZE"
   "SCROLL-BAR-PAGE-SIZE" "SCROLL-BAR-SCROLLEE" "SET-SCROLL-BAR-SCROLLEE"
   "SCROLL-BAR-SETTING" "SET-SCROLL-BAR-SETTING"
   "SCROLL-BAR-TRACK-THUMB-P" "SET-SCROLL-BAR-TRACK-THUMB-P"
   "SCROLL-BAR-WIDTH" "SET-SCROLL-BAR-WIDTH" "SCROLL-BAR-CHANGED"


   ;; 5.1
   "SCROLLER-MIXIN" "SCROLLER" "SCROLLER-PANE"
   "SCROLL-BAR-LIMITS" "NORMAL-SCROLL-BAR-LIMITS"
   "SCROLL-BAR-PAGE-SIZE" "SCROLL-BAR-SCROLL-SIZE"
   "UPDATE-SCROLL-BARS" "UPDATE-SCROLL-BAR-LIMITS"
   "UPDATE-THUMBS" "REPOSITION-SCROLL-BARS" "SCROLL-BAR-CHANGED"
   "SCROLLER" "V-SCROLLER" "H-SCROLLER"
   
   "SEQUENCE-DIALOG-ITEM" "TABLE-SEQUENCE" "SET-TABLE-SEQUENCE"
   "CELL-TO-INDEX" "INDEX-TO-CELL"

   ;; Dialog:

   "THROW-CANCEL" "CATCH-CANCEL" "CANCEL-BUTTON"
   "LOOK-FOR-A-BUTTON-NAMED-CANCEL"
   
   "MESSAGE-DIALOG" "SELECT-ITEM-FROM-LIST" "GET-STRING-FROM-USER"

   "MODAL-DIALOG" "RETURN-FROM-MODAL-DIALOG"
  
   "FIND-DIALOG-ITEM"
   
   "Y-OR-N-DIALOG"
   
   ;; ----------------------------------------
   ;; Chapter 6: Color
   ;; ----------------------------------------

   "*COLOR-AVAILABLE*"

   "MAKE-COLOR" "COLOR-RED" "COLOR-GREEN" "COLOR-BLUE" "COLOR-VALUES"
   "REAL-COLOR-EQUAL" "USER-PICK-COLOR"

   "SET-FORE-COLOR" "SET-BACK-COLOR" "GET-FORE-COLOR" "GET-BACK-COLOR"
   "WITH-FORE-COLOR" "WITH-BACK-COLOR"

   "PART-COLOR-LIST" "PART-COLOR" "SET-PART-COLOR"
   ;; 5.1
   "SET-PART-COLOR-LOOP"

   ;; Not implemented:
   ;; color-to-rgb rgb-to-color with-rgb *black-rgb* *white-rgb*
   
   ;;  Extensions:
   "COLOR-PARTS"

   "*BLACK-COLOR*" "*WHITE-COLOR*" "*PINK-COLOR*" "*RED-COLOR*"
   "*ORANGE-COLOR*" "*YELLOW-COLOR*" "*GREEN-COLOR*" "*DARK-GREEN-COLOR*"
   "*LIGHT-BLUE-COLOR*" "*BLUE-COLOR*" "*PURPLE-COLOR*" "*BROWN-COLOR*"
   "*TAN-COLOR*" "*GRAY-COLOR*" "*LIGHT-GRAY-COLOR*"
   "*LIGHTER-GRAY-COLOR*" "*DARK-GRAY-COLOR*" "*TOOL-BACK-COLOR*"

   ;; ----------------------------------------
   ;; Chapter 8: File System Interface
   ;; ----------------------------------------

   "CHOOSE-FILE-DIALOG" "CHOOSE-NEW-FILE-DIALOG"
   "CHOOSE-DIRECTORY-DIALOG" "CHOOSE-FILE-DEFAULT-DIRECTORY"
   "SET-CHOOSE-FILE-DEFAULT-DIRECTORY"
   "FULL-PATHNAME"
   "SET-MAC-FILE-TYPE"    "MAC-FILE-TYPE"   
   "SET-MAC-FILE-CREATOR" "MAC-FILE-CREATOR"
   
   ;; ----------------------------------------
   ;; Chapter 10: Events
   ;; ----------------------------------------

   "VIEW-ACTIVATE-EVENT-HANDLER" "VIEW-DEACTIVATE-EVENT-HANDLER"
   "VIEW-CLICK-EVENT-HANDLER" "VIEW-DOUBLE-CLICK-EVENT-HANDLER"
   "VIEW-KEY-EVENT-HANDLER" "ALLOW-TABS-P"
   "ALLOW-RETURNS-P" "KEY-HANDLER-MIXIN" "ALLOW-RETURNS-P" "ALLOW-TABS-P"
   "KEY-HANDLER-LIST" "CURRENT-KEY-HANDLER" "SET-CURRENT-KEY-HANDLER"
   "ADD-KEY-HANDLER" "REMOVE-KEY-HANDLER" "CHANGE-KEY-HANDLER"
   "KEY-HANDLER-P" "KEY-HANDLER-IDLE" "WINDOW-NULL-EVENT-HANDLER"
   "WINDOW-SELECT-EVENT-HANDLER" "WINDOW-KEY-UP-EVENT-HANDLER"
   "WINDOW-MOUSE-UP-EVENT-HANDLER" "WINDOW-GROW-EVENT-HANDLER"
   "WINDOW-DRAG-EVENT-HANDLER" "WINDOW-ZOOM-EVENT-HANDLER"
   "WINDOW-CLOSE-EVENT-HANDLER" "WINDOW-DO-FIRST-CLICK"
   "WINDOW-UPDATE-EVENT-HANDLER" "VIEW-DRAW-CONTENTS"
   "WINDOW-DRAW-GROW-ICON" "VIEW-MOUSE-POSITION" "MOUSE-DOWN-P"
   "DOUBLE-CLICK-P" "DOUBLE-CLICK-SPACING-P"
   "COMMAND-KEY-P" "CONTROL-KEY-P" "OPTION-KEY-P" "SHIFT-KEY-P"
   "CAPS-LOCK-KEY-P"
   "WAIT-MOUSE-UP-OR-MOVED"
   
   "UNKNOWN-WINDOW"


   "EVENT" "MAKE-EVENT" "EVENT-P" "COPY-EVENT" "EVENT-WHAT"
   "EVENT-MESSAGE" "EVENT-WHEN" "EVENT-WHERE" "EVENT-MODIFIERS"

   "*CURRENT-CHARACTER*" "*TOP-LISTENER*" "*MULTI-CLICK-COUNT*"
   "*CURRENT-EVENT*" "*EVENTHOOK*" "*IDLE*" "*IDLE-SLEEP-TICKS*"
   "*FOREGROUND-SLEEP-TICKS*" "*BACKGROUND-SLEEP-TICKS*"
   "*FOREGROUND-EVENT-TICKS*" "*BACKGROUND-EVENT-TICKS*"
   "*BREAK-LOOK-WHEN-UNINTERRUPTABLE*" "*EVENT-DISPATCH-TASK*"

   "EVENT-DISPATCH" "GET-NEXT-EVENT" "EVENT-TICKS" "SET-EVENT-TICKS"
   "WINDOW-EVENT" "WITHOUT-INTERRUPTS" "VIEW-CURSOR"
   "WINDOW-UPDATE-CURSOR" "VIEW-MOUSE-ENTER-EVENT-HANDLER"
   "VIEW-MOUSE-LEAVE-EVENT-HANDLER" "GET-TICK-COUNT"

   "*ARROW-CURSOR*" "*I-BEAM-CURSOR*" "*WATCH-CURSOR*" "*CURSORHOOK*"
   "SET-CURSOR" "UPDATE-CURSOR" "WITH-CURSOR" "MAKE-CURSOR"

   "*SCRAP-STATE*" "*SCRAP-HANDLER-ALIST*"
   "GET-SCRAP" "PUT-SCRAP" "SCRAP-HANDLER" "GET-INTERNAL-SCRAP"
   "SET-INTERNAL-SCRAP" "INTERNALIZE-SCRAP" "EXTERNALIZE-SCRAP"

   "EVAL-ENQUEUE" "GET-NEXT-QUEUED-FORM"
   "WITH-TIMER" 
   
   ;; ----------------------------------------
   ;; Chapter 11: Apple Events
   ;; ----------------------------------------

   ;; Application:

   "DEFAULT-APP-CREATOR" "*APPLICATION*" "*HIDE-WINDOIDS-ON-SUSPEND*"
   "ON-QUIT" "ON-SAVE" "ON-RESTORE" "ON-LOAD-AND-NOW" "ON-STARTUP"
   "ON-APPLICATION-DID-FINISH-LAUNCHING"

   "APPLICATION" "LISP-DEVELOPMENT-SYSTEM" "APPLICATION-ERROR"
   "APPLICATION-OVERWRITE-DIALOG" "FIND-EDIT-MENU" "APPLICATION-NAME"
   "APPLICATION-FILE-CREATOR" "APPLICATION-ABOUT-VIEW"
   "APPLICATION-ABOUT-DIALOG" "APPLICATION-SUSPEND-EVENT-HANDLER"
   "APPLICATION-RESUME-EVENT-HANDLER" "APPLICATION-EVAL-ENQUEUE"

   ;; Application AE handler methods:
   "OPEN-APPLICATION-HANDLER" "QUIT-APPLICATION-HANDLER"
   "OPEN-APPLICATION-DOCUMENT" "OPEN-DOCUMENTS-HANDLER"
   "PRINT-APPLICATION-DOCUMENT" "PRINT-DOCUMENTS-HANDLER"

   ;; Apple Events:
   "APPLEEVENT-ERROR" "OSERR" "ERROR-STRING" "AE-ERROR-STR" "AE-ERROR"
   "WITH-AEDESCS" "CHECK-REQUIRED-PARAMS" "APPLEEVENT-IDLE"
   "INSTALL-APPLEEVENT-HANDLER" "DEINSTALL-APPLEEVENT-HANDLER"
   "AE-GET-ATTRIBUTE-LONGINTEGER" "INSTALL-QUEUED-REPLY-HANDLER"
   "NO-QUEUED-REPLY-HANDLER" "QUEUED-REPLY-HANDLER"

   ;; ----------------------------------------
   ;; Annex D: QuickDraw
   ;; ----------------------------------------

   
   "PATTERN" "PATTERN-DATA" "MAKE-PATTERN"
   
   "PEN-SHOW" "PEN-HIDE" "PEN-SHOWN-P" "PEN-SIZE" "SET-PEN-SIZE"
   "PEN-PATTERN" "SET-PEN-PATTERN" "PEN-MODE" "SET-PEN-MODE" "PEN-STATE"
   "SET-PEN-STATE" "PEN-NORMAL"
   
   "PEN-STATE" "WITH-PEN-STATE"

   "STREAM-TYO"

   "MOVE-TO" "MOVE" "LINE-TO" "LINE"

   "FRAME-RECT"       "PAINT-RECT"       "ERASE-RECT"       "INVERT-RECT"       "FILL-RECT"
   "FRAME-OVAL"       "PAINT-OVAL"       "ERASE-OVAL"       "INVERT-OVAL"       "FILL-OVAL"
   "FRAME-ROUND-RECT" "PAINT-ROUND-RECT" "ERASE-ROUND-RECT" "INVERT-ROUND-RECT" "FILL-ROUND-RECT"
   "FRAME-ARC"        "PAINT-ARC"        "ERASE-ARC"        "INVERT-ARC"        "FILL-ARC"
   "FRAME-REGION"     "PAINT-REGION"     "ERASE-REGION"     "INVERT-REGION"     "FILL-REGION"
   "FRAME-POLYGON"    "PAINT-POLYGON"    "ERASE-POLYGON"    "INVERT-POLYGON"    "FILL-POLYGON"

   "START-POLYGON" "GET-POLYGON" "KILL-POLYGON" "OFFSET-POLYGON"
   "START-PICTURE" "GET-PICTURE" "KILL-PICTURE" "DRAW-PICTURE"

   "*TEMP-RGN*" "WITH-TEMP-RGNS" "WITH-HILITE-MODE" "WITH-CLIP-REGION"
   "REGION" "REGIONP" "NEW-REGION" "NEW-RGN" "DISPOSE-REGION"
   "COPY-REGION" "SET-EMPTY-REGION" "SET-RECT-REGION" "OPEN-REGION"
   "CLOSE-REGION" "OFFSET-REGION" "INSET-REGION" "INTERSECT-REGION"
   "UNION-REGION" "DIFFERENCE-REGION" "XOR-REGION" "POINT-IN-REGION-P"
   "RECT-IN-REGION-P" "EQUAL-REGION-P" "EMPTY-REGION-P"

   "CLIP-REGION" "SET-CLIP-REGION" "CLIP-RECT"
   "COPY-BITS" "GET-PIXEL" "MAKE-BITMAP"
   "MAP-POINT" "MAP-RECT" "MAP-REGION" "MAP-POLYGON"
   "SCALE-POINT"
   "SCROLL-RECT"
   
   "ORIGIN"  "SET-ORIGIN"
   "LOCAL-TO-GLOBAL" "GLOBAL-TO-LOCAL"

   "WITH-RECTANGLE-ARG"
   
   ;; Extension:
   "VIEW-PEN"

   ;; graphics:
   
   "DRAW-CHAR"
   "DRAW-STRING"
   "DRAW-POINT"
   "DRAW-LINE"
   "DRAW-RECT"    "FILL-RECT"    "ERASE-RECT"
   "DRAW-RECT*"   "FILL-RECT*"   "ERASE-RECT*"
   "DRAW-ELLIPSE" "FILL-ELLIPSE"

   "DRAW-PICTURE"

   ;; ----------------------------------------
   ;; miscellaneous:
   ;; ----------------------------------------

   "FIXNUMP"
   
   "WPTR"         ; this one won't be implemented, change the sources!
   )

  (:export
   ;; Instance drawing, to replace srcXor 
   "WITH-INSTANCE-DRAWING" "NEW-INSTANCE")
  
  (:export
   ;; FRED editor
   ;; FRED-Window will be replaced by hemlock-frame and hemlock-listener-frame.
   "FRED-WINDOW"
   "FRED-UPDATE"
   "FRED-BUFFER"
   "SET-FRED-DISPLAY-START-MARK"

   "ED-BEEP"
   "ED-KILL-SELECTION"

   "HEMLOCK-LISTENER-FRAME"
   "HEMLOCK-FRAME")
  
  (:export
   "BUFFER-CHAR"
   "BUFFER-CURRENT-SEXP"
   "BUFFER-INSERT"
   "BUFFER-INSERT-FILE"
   "BUFFER-SIZE"
   "BUFFER-SKIP-FWD-WSP&COMMENTS"
   "BUFFER-WRITE-FILE"
   "SELECTION-RANGE" "SET-SELECTION-RANGE")
  
  (:documentation "

The MCLGUI package implements the Mac OS GUI classes of MCL over the
OpenStep API.

Call (mclgui:initialize) before using any other function or variable
exported from this package.


The API is fully documented in:

http://code.google.com/p/mcl/source/browse/Macintosh+Common+Lisp+Ref.pdf

Chapter 2: Points and Fonts
Chapter 3: Menus
Chapter 4: Views and Windows
Chapter 5: Dialog Items and Dialogs
Chapter 6: Color
Chapter 10: Events
Chapter 11: Apple Events
Annex D: QuickDraw

LEGAL:

    GPL3

    Copyright Pascal J. Bourguignon 2012 - 2012

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

"))







;;;; THE END ;;;;
