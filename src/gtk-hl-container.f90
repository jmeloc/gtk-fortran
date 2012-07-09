! Copyright (C) 2011
! Free Software Foundation, Inc.

! This file is part of the gtk-fortran GTK+ Fortran Interface library.

! This is free software; you can redistribute it and/or modify
! it under the terms of the GNU General Public License as published by
! the Free Software Foundation; either version 3, or (at your option)
! any later version.

! This software is distributed in the hope that it will be useful,
! but WITHOUT ANY WARRANTY; without even the implied warranty of
! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
! GNU General Public License for more details.

! Under Section 7 of GPL version 3, you are granted additional
! permissions described in the GCC Runtime Library Exception, version
! 3.1, as published by the Free Software Foundation.

! You should have received a copy of the GNU General Public License along with
! this program; see the files COPYING3 and COPYING.RUNTIME respectively.
! If not, see <http://www.gnu.org/licenses/>.
!
! Contributed by James Tappin
! Last modification: 07-09-2012

! --------------------------------------------------------
! gtk-hl-container.f90
! Generated: Mon Jul  9 19:59:13 2012 GMT
! Please do not edit this file directly,
! Edit gtk-hl-container-tmpl.f90, and use ./mk_gtk_hl.pl to regenerate.
! --------------------------------------------------------


module gtk_hl_container
  !*
  ! Containers
  ! The high-level interface provides convenience interfaces for:
  ! * Window, the gtk top-level window.
  ! * Box, Horizontal and vertical boxes to pack widgets. This was added
  !   because the gtk_box_pack_start_defaults procedure is removed from GTK3.x
  ! * Table, a grid layout of widgets
  !   Note that the weird convention where rows comes before columns in sizing
  !   tables, but X before Y in adding widgets follows the convention of
  !   GTK proper.
  ! * Notebook, a tabbed container to pack widgets
  ! * ScrolledWindow, a scrolled window into which to place another widget.
  !/

  use gtk_sup
  use iso_c_binding
  ! autogenerated use's

  use gtk, only: gtk_accel_group_new, gtk_box_pack_start, &
       & gtk_container_set_border_width, gtk_hbox_new, gtk_label_new, &
       & gtk_notebook_append_page, gtk_notebook_insert_page,&
       & gtk_notebook_new, gtk_notebook_popup_disable,&
       & gtk_notebook_popup_enable, gtk_notebook_prepend_page,&
       & gtk_notebook_set_scrollable,&
       & gtk_notebook_set_show_tabs, gtk_notebook_set_tab_detachable,&
       & gtk_notebook_set_tab_pos, gtk_notebook_set_tab_reorderable,&
       & gtk_table_attach, gtk_table_get_size, gtk_table_new,&
       & gtk_table_resize, gtk_table_set_col_spacing,&
       & gtk_table_set_col_spacings, gtk_table_set_row_spacing,&
       & gtk_table_set_row_spacings, &
!!$3       & gtk_grid_new, gtk_grid_set_row_homogeneous, &
!!$3       & gtk_grid_set_column_homogeneous, gtk_grid_set_row_spacing, &
!!$3       & gtk_grid_set_column_spacing, gtk_grid_attach, &
!!$3       & gtk_widget_set_margin_left, gtk_widget_set_margin_right, &
!!$3       & gtk_widget_set_margin_top, gtk_widget_set_margin_bottom, &
!!$3       & gtk_widget_set_hexpand, gtk_widget_set_vexpand,  &
!!$3       & gtk_widget_set_halign, gtk_widget_set_valign, &
       & gtk_vbox_new,&
       & gtk_widget_set_sensitive, gtk_window_add_accel_group,&
       & gtk_window_new, gtk_window_set_decorated,&
       & gtk_window_set_default, gtk_window_set_default_size,&
       & gtk_window_set_deletable, gtk_window_set_keep_above,&
       & gtk_window_set_keep_below, gtk_window_set_resizable,&
       & gtk_window_set_title, gtk_window_set_transient_for, &
       & gtk_window_set_icon_name, gtk_window_set_icon_from_file, &
       & gtk_window_set_icon, &
       & gtk_notebook_set_group, &
!!$3       & gtk_notebook_set_group_name, &
       & gtk_scrolled_window_new, gtk_scrolled_window_set_policy, &
       & gtk_widget_set_size_request, gtk_scrolled_window_add_with_viewport, &
       & gtk_container_add, &
       & GTK_WINDOW_TOPLEVEL, GTK_EXPAND, GTK_FILL, &
!!$3       & GTK_ALIGN_FILL, GTK_ALIGN_CENTER, &
       & TRUE, FALSE, g_signal_connect, &
       & GTK_POLICY_AUTOMATIC

  implicit none

contains
  !+
  function hl_gtk_window_new(title, destroy, delete_event, data_destroy, &
       & data_delete_event, border, wsize, sensitive, resizable, decorated, &
       & deletable, above, below, parent, accel_group, icon, icon_file,&
       & icon_name) result(win)

    type(c_ptr) :: win
    character(kind=c_char), dimension(*), intent(in), optional :: title
    type(c_funptr), optional :: destroy, delete_event
    type(c_ptr), optional :: data_destroy, data_delete_event
    integer, optional, intent(in) :: border
    integer, optional, intent(in), dimension(2) :: wsize
    integer(kind=c_int), intent(in), optional :: sensitive, resizable, decorated
    integer(kind=c_int), intent(in), optional :: deletable, above, below
    type(c_ptr), intent(in), optional :: parent
    type(c_ptr), intent(out), optional :: accel_group
    type(c_ptr), intent(in), optional :: icon
    character(kind=c_char), dimension(*), intent(in), optional :: icon_name, &
         & icon_file

    ! Higher-level interface to make a gtk_window
    !
    ! TITLE: String: optional: Title for the window
    ! DESTROY: c_funptr: optional: Callback for the "destroy" signal
    ! DELETE_EVENT: c_funptr: optional: Callback for the "delete-event" signal
    ! DATA_DESTROY: c_ptr: optional: Data to be passed to the destroy
    ! 		signal handler
    ! DATA_DELETE_EVENT: c_ptr: optional: Data to be passed to the
    ! 		delete_event signal handler
    ! BORDER: integer: optional: Size of the window border
    ! WSIZE: integer(2): optional: Size of the window
    ! SENSITIVE: boolean: optional: Whether the widget should initially
    ! 		be sensitive or not.
    ! RESIZABLE: boolean: optional: Is the window resizable.
    ! DECORATED: boolean: optional: Set FALSE to disable window decorations.
    ! DELETABLE: boolean: optional: Set to FALSE to remove the "delete" button.
    ! ABOVE: boolean: optional: Set to TRUE to make the window stay on top of
    ! 		others.
    ! BELOW: boolean: optional: Set to TRUE to make the window stay below
    ! 		others.
    ! PARENT: c_ptr: optional: An optional parent window for the new window.
    ! ACCEL_GROUP: c_ptr: optional: An accelerator group, used to add
    ! 		accelerators to widgets within the window.
    ! ICON: c_ptr: optional : A GdkPixbuf containing the icon for the window.
    ! ICON_FILE: String : optional : A file from which to read the icon for
    ! 		the window.
    ! ICON_NAME: String : optional : The name of a standard icon to use for
    ! 		the window.
    !
    ! Only one way of setting the icon should be given, if more than one
    ! is specified the priority is ICON, ICON_FILE, ICON_NAME.
    !-

    integer(kind=c_int) :: icon_ok

    win = gtk_window_new (GTK_WINDOW_TOPLEVEL)
    call gtk_window_set_title(win, title)

    if (present(border)) call gtk_container_set_border_width(win, border)
    if (present(wsize)) &
         & call gtk_window_set_default_size(win, wsize(1), wsize(2))

    if (present(delete_event)) then
       if (present(data_delete_event)) then
          call g_signal_connect(win, "delete-event"//C_NULL_CHAR, delete_event, &
               & data_delete_event)
       else
          call g_signal_connect(win, "delete-event"//C_NULL_CHAR, delete_event)
       end if
    end if

    if (present(destroy)) then
       if (present(data_destroy)) then
          call g_signal_connect(win, "destroy"//C_NULL_CHAR, destroy, &
               & data_destroy)
       else
          call g_signal_connect(win, "destroy"//C_NULL_CHAR, destroy)
       end if
    end if

    if (present(sensitive)) &
         & call gtk_widget_set_sensitive(win, sensitive)

    if (present(resizable)) &
         & call gtk_window_set_resizable(win, resizable)
    if (present(decorated)) &
         & call gtk_window_set_decorated(win, decorated)
    if (present(deletable)) &
         & call gtk_window_set_deletable(win, deletable)
    if (present(above)) &
         & call gtk_window_set_keep_above(win, above)
    if (present(below)) &
         & call gtk_window_set_keep_below(win, below)

    if (present(parent)) call gtk_window_set_transient_for(win, parent)

    if (present(icon)) then
       call gtk_window_set_icon(win, icon)
    else if (present(icon_file)) then
       icon_ok = gtk_window_set_icon_from_file (win, icon_file, c_null_ptr)
    else if (present(icon_name)) then
       call gtk_window_set_icon_name(win, icon_name)
    end if

    if (present(accel_group)) then
       accel_group = gtk_accel_group_new()
       call gtk_window_add_accel_group(win, accel_group)
    end if
  end function hl_gtk_window_new

  !+
  function hl_gtk_box_new(horizontal, homogeneous, spacing) result(box)

    type(c_ptr) :: box
    integer(kind=c_int), intent(in), optional :: horizontal, homogeneous
    integer(kind=c_int), intent(in), optional :: spacing

    ! Generic packing box
    !
    ! HORIZONTAL: boolean: optional: Set to TRUE to make a row box. FALSE or
    !		absent implies a column box.
    ! HOMOGENEOUS: boolean: optional: If set to TRUE then all children are
    ! 		the same size, FALSE or absent allows each widget to take its
    ! 		natural size.
    ! SPACING: c_int: optional: Set the space between children.
    !-

    integer(kind=c_int) :: grid, space

    if (present(homogeneous)) then
       grid = homogeneous
    else
       grid=FALSE
    end if

    if (present(spacing)) then
       space = spacing
    else
       space=0
    end if

    if (present(horizontal)) then
       if (horizontal == TRUE) then
          box = gtk_hbox_new(grid, space)
       else
          box = gtk_vbox_new(grid, space)
       end if
    else
       box = gtk_vbox_new(grid, space)
    end if
  end function hl_gtk_box_new

  !+
  subroutine hl_gtk_box_pack(box, child, expand, fill, padding, atend)

    type(c_ptr), intent(in) :: box, child
    integer(kind=c_int), intent(in), optional :: expand, fill
    integer(kind=c_int), intent(in), optional :: padding
    integer(kind=c_int), intent(in), optional :: atend

    ! Put a widget into a box
    !
    ! BOX: c_ptr: required: The box into which to put the child
    ! CHILD: c_ptr: required: The child to pack
    ! EXPAND: boolean: optional: If TRUE then expand this child when
    ! 		filling the box, if FALSE don't, (Default TRUE)
    ! FILL: boolean: optional: If TRUE, then expand the widget when
    ! 		expanding, if FALSE, then put space round it. (Default TRUE,
    ! 		ignored if EXPAND==FALSE.
    ! PADDING: c_int: optional: Extra space to put around the child in the
    ! 		fill direction.
    ! ATEND: boolean: optional: If present and TRUE, then put the child at
    ! 		the end of the box rather than the start.
    !-

    integer(kind=c_int) :: iexp, ifill, ipad, iend

    if (present(expand)) then
       iexp = expand
    else
       iexp = TRUE
    end if
    if (present(fill)) then
       ifill = fill
    else
       ifill = TRUE
    end if
    if (present(padding)) then
       ipad = padding
    else
       ipad = 0
    end if
    if (present(atend)) then
       iend = atend
    else
       iend = FALSE
    end if

    call gtk_box_pack_start(box, child, iexp, ifill, ipad)
  end subroutine hl_gtk_box_pack

  !+
  function hl_gtk_table_new(nrows, ncols, homogeneous, row_spacing, &
       & col_spacing, row_homogeneous, col_homogeneous) result(table)

    type(c_ptr) :: table
    integer(kind=c_int), intent(in), optional :: nrows, ncols
    integer(kind=c_int), intent(in), optional :: homogeneous
    integer(kind=c_int), intent(in), optional :: row_spacing, col_spacing
    integer(kind=c_int), intent(in), optional :: row_homogeneous,&
         & col_homogeneous

    ! Utility interface to create a table container
    !
    ! NROWS: c_int: optional: The initial number of rows.
    ! NCOLS: c_int: optional: The initial number of columns.
    ! HOMOGENEOUS: boolean: optional: Whether the cells all have the
    ! 	same size.
    ! ROW_HOMOGENEOUS: boolean: optional: Whether the rows all have the
    ! 	same size.
    ! COL_HOMOGENEOUS: boolean: optional: Whether the columns all have the
    ! 	same size.
    ! ROW_SPACING: c_int: optional: Spacing between rows.
    ! COL_SPACING: c_int: optional: Spacing between columns.
    !
    ! Note
    ! This is implemented as a GtkTable for Gtk+2.x and as a GtkGrid for 3.x
    ! For 2.x, the ROW and COL_HOMOGENEOUS settings are treated as HOMOGENOUS
    ! except that if both are given and their values differ then homogenous is
    ! not set.
    ! For 3.x the ROW and COL settings take precedence over the common setting.
    ! The NROWS and NCOLS arguments are ignored for Gtk+ 3.x
    !-

    integer(kind=c_int) :: grid, nr,nc

    if (present(homogeneous)) then
       grid = homogeneous
    else if (present(row_homogeneous) .and. present(col_homogeneous)) then
       if (row_homogeneous == col_homogeneous) then
          grid = row_homogeneous
       else
          grid = FALSE
       end if
    else if (present(row_homogeneous)) then
       grid = row_homogeneous
    else if (present(col_homogeneous)) then
       grid = col_homogeneous
    else
       grid = FALSE
    end if

    if (present(nrows)) then
       nr = nrows
    else
       nr = 1
    end if
    if (present(ncols)) then
       nc = ncols
    else
       nc = 1
    end if

    table = gtk_table_new(nr, nc, grid)

    if (present(row_spacing)) &
         & call gtk_table_set_row_spacings(table, row_spacing)
    if (present(col_spacing)) &
         & call gtk_table_set_col_spacings(table, col_spacing)

!!$3    integer(kind=c_int) :: gridr, gridc
!!$3
!!$3    if (present(homogeneous)) then
!!$3       gridr = homogeneous
!!$3       gridc = homogeneous
!!$3    else
!!$3       gridr = FALSE
!!$3       gridc = FALSE
!!$3    end if
!!$3
!!$3    if (present(row_homogeneous)) gridr = row_homogeneous
!!$3    if (present(col_homogeneous)) gridc = col_homogeneous
!!$3
!!$3    table = gtk_grid_new()
!!$3    call gtk_grid_set_row_homogeneous(table, gridr)
!!$3    call gtk_grid_set_column_homogeneous(table, gridc)
!!$3
!!$3    if (present(row_spacing)) &
!!$3         & call gtk_grid_set_row_spacing(table, row_spacing)
!!$3    if (present(col_spacing)) &
!!$3         & call gtk_grid_set_column_spacing(table, col_spacing)

  end function hl_gtk_table_new

  !+
  subroutine hl_gtk_table_attach(table, widget, ix, iy, xspan, yspan, &
       & xpad, ypad, xopts, yopts)

    type(c_ptr), intent(in) :: table, widget
    integer(kind=c_int), intent(in) :: ix, iy
    integer(kind=c_int), intent(in), optional :: xspan, yspan
    integer(kind=c_int), intent(in), optional :: xpad, ypad
    integer(kind=c_int), intent(in), optional :: xopts, yopts

    ! Attach a widget to a table
    !
    ! TABLE: c_ptr: required: The table to which to attach
    ! WIDGET: c_ptr: required: The widget to attach to the table
    ! IX: c_int: required: The cell number of the left edge of the widget
    ! IY: c_int: required: The cell number of the top edge of the widget.
    ! XSPAN: c_int: optional: How many cells to span in the X direction (1)
    ! YSPAN: c_int: optional: How many cells to span in the Y direction (1)
    ! XPAD: c_int: optional: Padding around the cell in the X direction
    ! YPAD: c_int: optional: Padding in the Y direction
    ! XOPTS: c_int: optional: X fill/expand options (from the
    ! 		GtkAttachOptions enumerator, or 0 for none)
    ! YOPTS: c_int: optional: Y fill/expand options.
    !
    ! N.B. GTK_SHRINK in the options is ignored in Gtk+ 3.x
    !-

    integer(kind=c_int) :: ixtop, iytop
    integer(kind=c_int) :: ixpad, iypad
    integer(kind=c_int) :: ixopt, iyopt
!!$3    integer(kind=c_int) :: ixsz, iysz
    integer(kind=c_int) :: ixexp, iyexp, ixfill, iyfill

    if (present(xspan)) then
       ixtop = ix + xspan
!!$3       ixsz = xspan
    else
       ixtop = ix+1
!!$3       ixsz = 1
    end if
    if (present(yspan)) then
       iytop = iy + yspan
!!$3       iysz = yspan
    else
       iytop = iy+1
!!$3       iysz = 1
    end if

    if (present(xpad)) then
       ixpad = xpad
    else
       ixpad = 0
    end if
    if (present(ypad)) then
       iypad = ypad
    else
       iypad = 0
    end if

    if (present(xopts)) then
       ixopt = xopts
!!$3       ixexp = f_c_logical(iand(xopts, GTK_EXPAND) == GTK_EXPAND)
!!$3       if (iand(xopts, GTK_FILL) == GTK_FILL) then
!!$3          ixfill = GTK_ALIGN_FILL
!!$3       else
!!$3          ixfill = GTK_ALIGN_CENTER
!!$3       end if
    else
       ixopt = ior(GTK_EXPAND, GTK_FILL)
!!$3       ixexp = TRUE
!!$3       ixfill = GTK_ALIGN_FILL
    end if
    if (present(yopts)) then
       iyopt = yopts
!!$3       iyexp = f_c_logical(iand(yopts, GTK_EXPAND) == GTK_EXPAND)
!!$3       if (iand(yopts, GTK_FILL) == GTK_FILL) then
!!$3          iyfill = GTK_ALIGN_FILL
!!$3       else
!!$3          iyfill = GTK_ALIGN_CENTER
!!$3       end if
    else
       iyopt = ior(GTK_EXPAND, GTK_FILL)
!!$3       iyexp = TRUE
!!$3       iyfill = GTK_ALIGN_FILL
    end if

    call gtk_table_attach(table, widget, ix, ixtop, iy, iytop, &
         & ixopt, iyopt, ixpad, iypad)

!!$3    call gtk_grid_attach(table, widget, ix, iy, ixsz, iysz)
!!$3    if (present(xpad)) then
!!$3       call gtk_widget_set_margin_left(widget, xpad)
!!$3       call gtk_widget_set_margin_right(widget, xpad)
!!$3    end if
!!$3    if (present(ypad)) then
!!$3       call gtk_widget_set_margin_top(widget, ypad)
!!$3       call gtk_widget_set_margin_bottom(widget, ypad)
!!$3    end if
!!$3
!!$3    call gtk_widget_set_hexpand (widget, ixexp)
!!$3    call gtk_widget_set_vexpand (widget, iyexp)
!!$3    call gtk_widget_set_halign (widget, ixfill)
!!$3    call gtk_widget_set_valign (widget, iyfill)

  end subroutine hl_gtk_table_attach

  !+
  subroutine hl_gtk_table_expand(table, ny, nx)

    type(c_ptr), intent(in) :: table
    integer(kind=c_int), intent(in), optional :: ny, nx

    ! Add rows and/or columns to a table
    !
    ! TABLE: c_ptr: required: The table to enlarge
    ! NY: c_int: optional: How many rows to add
    ! NX: c_int: optional: How many columns to add
    !
    ! To set an absolute size, use gtk_table_resize
    ! directly. Negative NX and/or NY will reduce the table.
    ! For Gtk+3.x this is a do-nothing routine.
    !-

    integer(kind=c_int), target :: sx, sy

    if (.not. (present(nx) .or. present(ny))) return  ! No resize

    call gtk_table_get_size(table, c_loc(sy), c_loc(sx))

    if (present(nx)) sx = sx+nx
    if (present(ny)) sy = sy+ny

   call gtk_table_resize(table, sy, sx)

  end subroutine hl_gtk_table_expand

  !+
  function hl_gtk_notebook_new(show_tabs, tab_position, popup, &
       & scrollable, group, switch_page, data) result(nbook)

    type(c_ptr) :: nbook
    integer(kind=c_int), intent(in), optional :: show_tabs
    integer(kind=c_int), intent(in), optional :: tab_position
    integer(kind=c_int), intent(in), optional :: popup, scrollable
    character(kind=c_char), intent(in), optional, dimension(*), target :: group
    type(c_funptr), optional :: switch_page
    type(c_ptr), intent(in), optional :: data

    ! Convenience function to create a notebook (tabbed) container
    !
    ! SHOW_TABS: boolean: optional: Whether the tabs are visible
    ! TAB_POSITION: c_int: optional:  Where the tabs are placed (from the
    ! 		GtkPositionType enumerator).
    ! POPUP: boolean: optional: Whether to have a popup tab selector.
    ! SCROLLABLE: boolean: optional: Whether the tabs are scrollable if
    ! 		there are too many to fit.
    ! GROUP: string: optional: A group name for the notebook (needed if you
    ! 		want to drag tabs from one book to another). N.B. For GTK+2,
    ! 		this probably has to be a variable to work.
    ! SWITCH_PAGE: c_funptr: optional: A callback to be called when the page
    ! 		selection is changed (signal switch-page). Note that this
    ! 		callback has 4 arguments: the notebook, the selected page, the
    ! 		index of that page and the user data.
    ! DATA: c_ptr: optional: Data to pass the the switch-page callback.
    !-

    nbook = gtk_notebook_new()

    if (present(show_tabs)) &
         & call gtk_notebook_set_show_tabs(nbook, show_tabs)

    if (present(tab_position)) &
         & call gtk_notebook_set_tab_pos(nbook, tab_position)

    if (present(popup)) then
       if (popup == FALSE) then
          call gtk_notebook_popup_disable(nbook)
       else
          call gtk_notebook_popup_enable(nbook)
       end if
    end if

    if (present(scrollable)) &
         & call gtk_notebook_set_scrollable(nbook, scrollable)

    if (present(group)) &
!!$3         & call gtk_notebook_set_group_name(nbook, group)
         & call gtk_notebook_set_group(nbook, c_loc(group))

    if (present(switch_page)) then
       if (present(data)) then
          call g_signal_connect(nbook, "switch-page"//c_null_char, &
               & switch_page, data)
       else
          call g_signal_connect(nbook, "switch-page"//c_null_char, &
               & switch_page)
       end if
    end if

  end function hl_gtk_notebook_new

  !+
  function hl_gtk_notebook_add_page(nbook, page, position, at_start, &
       & reorderable, detachable, label) result(location)

    integer(kind=c_int) :: location
    type(c_ptr), intent(in) :: nbook, page
    integer(kind=c_int), intent(in), optional :: position
    integer(kind=c_int), intent(in), optional :: at_start, reorderable, &
         & detachable
    character(kind=c_char), dimension(*), intent(in), optional :: label

    ! Convenience function to add a page to a notebook.
    !
    ! NBOOK: c_ptr: required: The book to which to add the page
    ! PAGE: c_ptr: required: The page to at to the book.
    ! POSITION: c_int: optional: The position at which to add the page.
    ! AT_START: boolean: optional: Set to TRUE to add at the start. (If neither
    ! 		AT_START nor POSITION is given the page is added at the end).
    ! REORDERABLE: boolean: optional: Whether the tab can be reordered by
    ! 		drag and drop
    ! DETACHABLE: boolean: optional: Whether the tab can be dragged to a
    ! 		different notebook (requires a group name for the notebooks).
    ! LABEL: string: optional: A label to show on the tab.
    !
    ! Returns the location at which the tab was added or -1 for failure.
    !-

    type(c_ptr) :: lwidget
    integer(kind=c_int) :: istart

    if (present(label)) then
       lwidget = gtk_label_new(label)
    else
       lwidget = C_NULL_PTR
    end if

    if (present(position)) then
       location = gtk_notebook_insert_page(nbook, page, lwidget, position)
    else
       if (present(at_start)) then
          istart = at_start
       else
          istart = FALSE
       end if
       if (istart == FALSE) then
          location = gtk_notebook_append_page(nbook, page, lwidget)
       else
          location = gtk_notebook_prepend_page(nbook, page, lwidget)
       end if
    end if

    if (location < 0) return

    if (present(reorderable)) &
         & call gtk_notebook_set_tab_reorderable(nbook, page, reorderable)

    if (present(detachable)) &
         & call gtk_notebook_set_tab_detachable(nbook, page, detachable)

  end function hl_gtk_notebook_add_page

  !+
  function hl_gtk_scrolled_window_new(hpolicy, vpolicy, &
       & hsize, vsize, hadjustment, vadjustment) result(win)

    type(c_ptr) :: win
    integer(kind=c_int), intent(in), optional :: hpolicy, vpolicy
    integer(kind=c_int), intent(in), optional :: hsize, vsize
    type(c_ptr), intent(in), optional :: hadjustment, vadjustment

    ! Create a scrolled window, with convenient settings.
    !
    ! HPOLICY: c_int: optional: Whether to show the horizontal scrollbar
    ! 		default- GTK_POLICY_AUTOMATIC, allowed- any GTK_POLICY_TYPE
    ! VPOLICY: c_int: optional: Whether to show the vertical scrollbar
    ! 		default- GTK_POLICY_AUTOMATIC, allowed- any GTK_POLICY_TYPE
    ! HSIZE: c_int: optional: The size of the window in the horizontal
    ! 		direction. 
    ! VSIZE: c_int: optional: The size of the window in the vertical
    ! 		direction.
    ! HADJUSTMENT: c_ptr: optional: An adjustment widget to use in place
    ! 		of the automatically generated scrollbar in the horizontal
    ! 		direction.
    ! VADJUSTMENT: c_ptr: optional: An adjustment widget to use in place
    ! 		of the automatically generated scrollbar in the vertical
    ! 		direction.
    !-

    integer(kind=c_int) :: hpol, vpol, hsz, vsz
    type(c_ptr) :: hadj, vadj
    logical :: have_size, have_policy

    ! Set up the scroll bar policies.
    have_policy = .false.
    if (present(hpolicy)) then
       hpol = hpolicy
       have_policy = .true.
    else
       hpol = GTK_POLICY_AUTOMATIC
    end if
    if (present(vpolicy)) then
       vpol = vpolicy
       have_policy = .true.
    else
       vpol = GTK_POLICY_AUTOMATIC
    end if

    ! Set up the sizes
    have_size = .false.
    if (present(hsize)) then
       hsz = hsize
       have_size = .true.
    else
       hsz = -1
    end if
    if (present(vsize)) then
       vsz = vsize
       have_size = .true.
    else
       vsz = -1
    end if

    ! Set up the adjustments
    if (present(hadjustment)) then
       hadj = hadjustment
    else
       hadj = c_null_ptr
    end if
    if (present(vadjustment)) then
       vadj = vadjustment
    else
       vadj = c_null_ptr
    end if

    win = gtk_scrolled_window_new(hadj, vadj)

    if (have_policy) call gtk_scrolled_window_set_policy(win, hpol, vpol)
    if (have_size) call gtk_widget_set_size_request(win, hsz, vsz)
  end function hl_gtk_scrolled_window_new

  !+
  subroutine hl_gtk_scrolled_window_add(win, child, viewport)
    type(c_ptr), intent(in) :: win, child
    integer(kind=c_int), intent(in), optional :: viewport

    ! Add a widget to a scrolled window.
    !
    ! WIN: c_ptr: required: The scrolled window.
    ! CHILD: c_ptr: required: The widget to insert.
    ! VIEWPORT: c_int: optional: Set this to true if the child widget
    ! 		requires a viewport between it and the scrolled window.
    ! 		Unfortunately I can't see a way to determine automatically
    ! 		whether this is needed.
    !-

    logical :: vp

    if (present(viewport)) then
       vp = c_f_logical(viewport)
    else
       vp = .false.
    end if

    if (vp) then
       call gtk_scrolled_window_add_with_viewport(win, child)
    else
       call gtk_container_add(win, child)
    end if
  end subroutine hl_gtk_scrolled_window_add

end module gtk_hl_container
