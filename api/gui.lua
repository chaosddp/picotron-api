---@diagnostic disable: missing-return

--[[
A GUI in Picotron is a tree of tables ("gui elements"), where each element has some basic attributes like size and position, along with optional callbacks for responding to events like clicking and dragging.
]]

--- @interface GuiElementBase
--- @field x number x position
--- @field y number y position
--- @field width number width
--- @field height number height


--- @class GuiEvent
--- @field mx number mouse x position
--- @field my number mouse y position
--- @field mb number mouse button
--- @field dx number mouse x delta
--- @field dy number mouse y delta
--- @field has_pointer boolean true when the mouse cursor is inside the element
--- @field wheel_x number mouse wheel x delta
--- @field wheel_y number mouse wheel y delta
--- @field mx0 number previous mx value
--- @field my0 number previous my value
--- @field last_mb number last mouse button
--- @field items table<any> list of items


--- @class GuiElement: GuiElementBase
--- @field width_rel? number          width relative to parent (1.0 to match)
--- @field height_rel? number         height relative to parent (1.0 to match)
--- @field justify? string            horizontal justification: "left" "center" "right"
--- @field vjustify? string           vertical justification: "top" "center" "bottom"
--- @field hidden? boolean             self and children are not drawn and not interactive
--- @field ghost? boolean              drawn but not interactive
--- @field min_width? number          clamp element width to be no smaller that this value in pixels
--- @field min_height? number         clamp element height to be no smaller that this value in pixels
--- @field clip_to_parent? boolean     clip drawing and interaction to the parent's region
--- @field confine_to_parent? boolean  force the position of the element inside parent with no overlaps
--- @field confine_to_clip? boolean    force the position of the element inside clip rect with no overlaps
--- @field squash_to_parent? boolean   automatically adjust size of element to remain inside parent region
--- @field squash_to_clip? boolean     automatically adjust size of element to remain inside clipping region
local GuiElement = {}

--- Attaches an element (el) to the current gui element, and returns the newly attached element.
---
--- el is a table that should have (at least) x, y, width and height attributes:
---
--- @param el GuiElementBase
--- @return GuiElement
function GuiElement:attach(el) end

--- @class GuiButtonBase: GuiElementBase
--- @field label string button label
--- @field fgcol number button text color
--- @field bgcol number button background color
--- @field border number button border color
local ButtonBase = {}

--- attach a button
--- @param el GuiButtonBase
--- @return GuiElement
function GuiElement:attach_button(el) end

--- @class GuiScrollbarAttribs
--- @field bgcol? number background colour
--- @field fgcol? number foreground colour
--- @field autohide? boolean when true, the bar disappears when there is nothing to scroll

--- @param attribs? GuiScrollbarAttribs attributes of the scrollbar
--- @return GuiElement
function GuiElement:attach_scrollbars(attribs) end

--- @class GuiPulldownAttribs
--- @field x number x position of the pulldown
--- @field y number y position of the pulldown
--- @field width number width of the pulldown
--- @field height number height of the pulldown

--- @param attribs GuiPulldownAttribs
--- @return GuiElement
function GuiElement:attach_pulldown(attribs) end

--- @class GuiPulldownItem
--- @field label? string
--- @field action? fun(self: GuiElement):void
--- @field divider? boolean

--- @param el GuiPulldownItem
--- @return GuiElement
function GuiElement:attach_pulldown_item(el) end

--- @class GuiTextEditorOptions
--- @field show_line_numbers? boolean           show_line_numbers
--- @field embed_pods? boolean                  render images
--- @field syntax_highlighting? boolean         syntax_highlighting
--- @field show_tabs? boolean                  
--- @field max_lines? number                   maximum lines of text allowed
--- @field has_search? boolean                  ctrl+f brings up a search box
--- @field bgcol? number                       background colour
--- @field fgcol? number                       foreground
--- @field curcol? number                      cursor colour (default: 14)
--- @field selcol? number                      selection colour (default: 10)
--- @field lncol? number                       line numbers background (default:16)
--- @field block_scrolling? boolean             when true, do not scroll
--- @field key_callback? fun():void                per-key callbacks e,g, {enter=function() end, tab=function() end}
--- @field text_callback? fun():void               similar, but for textinput events, e.g. {[" "] = function() end}
--- @field margin_top? number                  pixels at top (default: 3)
--- @field margin_left? number                 pixels at left (default: 4)

--- @class GuiTextEditor
local GuiTextEditor = {}

--- @return string[]
function GuiTextEditor:get_text() end

--- @param str_tbl string[]
function GuiTextEditor:set_text(str_tbl) end

--- @return number @x position
--- @return number @y position
function GuiTextEditor:get_cursor() end

--- @param x number x position
--- @param y number y position
function GuiTextEditor:set_cursor(x, y) end

--- @param options GuiTextEditorOptions
--- @return GuiTextEditor
function GuiElement:attach_text_editor(options) end


--- Remove self (gui_el) from the parent's list of child elements.
--- @param child? GuiElement
--- @return GuiElement @the detached element
--- @overload fun():void
function GuiElement:detach(child) end

--- draw_all() are normally called oncer per frame from _draw
function GuiElement:draw_all() end

--- update_all() are normally called oncer per frame from _draw
function GuiElement:update_all() end

--- put element on top
function GuiElement:bring_to_front() end

--- GUI element callbacks

--- called gui:update_all
function GuiElement:update() end

--- gui_draw_all
--- @param event GuiEvent
function GuiElement:draw(event) end

--- mouse button is clicked
--- @param event GuiEvent
function GuiElement:click(event) end

--- mouse button is held: msg.mx0 msg.my0 give the original position
--- @param event GuiEvent
function GuiElement:drag(event) end

--- on mouse button release: msg.mx0 msg.my0 msg.last_mb give the previous state
--- @param event GuiEvent
function GuiElement:release(event) end

--- after two clicks within 400ms
--- @param event GuiEvent
function GuiElement:doubleclick(event) end

--- when a click is released < 4 pixels away from its original position
--- @param event GuiEvent
function GuiElement:tap(event) end

--- after two taps within 400ms
--- @param event GuiEvent
function GuiElement:doubletap(event) end

--- mouse button is not held, but mouse cursor is over element
--- @param event GuiEvent
function GuiElement:hover(event) end

--- mouse wheel scroll with: msg.wheel_x msg.wheel_y
--- @param event GuiEvent
function GuiElement:mousewheel(event) end

--- msg.items is table of items dragged over that element but not yet dropped
--- @param event GuiEvent
function GuiElement:drag_items(event) end

--- msg.items is table of items dropped into the window
--- @param event GuiEvent
function GuiElement:drop_items(event) end

--- @param event GuiEvent
function GuiElement:drop_files(event) end

--- @param event GuiEvent
function GuiElement:drag_files(event) end

--- Create a root gui element. The root element is the same as any other gui element, with the addition of two special methods: draw_all() and update_all(), that are normally called oncer per frame from _draw and _update
--- @param attribs? any
--- @return GuiElement
function create_gui(attribs) end

--- @class MenuItemAttribs
--- @field id? string         an identifying string used to update a particular menu item
--- @field label? string      a string, or a function returning the string shown to the user
--- @field shortcut? string   an optional shortcut to invoke that item (e.g. CTRL-C to copy)
--- @field action? fun():void     a function that is called when the user selects that item
--- @field stay_open? boolean  when true, the pulldown / pause menu does not close on selection
--- @field divider? boolean    when true, a single non-interactive divider item is added


--- @param attribs MenuItemAttribs
function menuitem(attribs) end