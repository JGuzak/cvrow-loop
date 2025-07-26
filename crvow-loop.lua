-- CVrow Loop
-- by Tiny Sound

UI = require("ui")

local param_prefix = "cvrow_loop"

local buffer_page = nil


-- Future idea, enable midi cc input for recording to buffers?
-- Each buffer has parameters exposed for CC number, value range, and invert


function init()
  buffer_page =  UI.Pages.new(1,2)
  params:add_separator(param_prefix .. "_separator", "CVrow Loop")
  params:add_group(param_prefix .. "_buffer_1_group", "Buffer 1", 2)
  params:add_number(param_prefix .. "_buffer_1_crow_input", "Crow Input", 1, 2, 1)
  params:add_binary(param_prefix .. "_buffer_1_record", "Record", "toggle", false)
  params:add_group(param_prefix .. "_buffer_2_group", "Buffer 2", 2)
  params:add_number(param_prefix .. "_buffer_2_crow_input", "Crow Input", 1, 2, 2)
  params:add_binary(param_prefix .. "_buffer_2_record", "Record", "toggle", false)
  params:add_group(param_prefix .. "_buffer_3_group", "Buffer 3", 2)
  params:add_number(param_prefix .. "_buffer_3_crow_input", "Crow Input", 1, 2, 1)
  params:add_binary(param_prefix .. "_buffer_3_record", "Record", "toggle", false)
  params:add_group(param_prefix .. "_buffer_4_group", "Buffer 4", 2)
  params:add_number(param_prefix .. "_buffer_4_crow_input", "Crow Input", 1, 2, 2)
  params:add_binary(param_prefix .. "_buffer_4_record", "Record", "toggle", false)
  params:list()
end

function redraw()
  screen.clear()
  buffer_page:redraw()
  screen.update()
end

function key(n, z)
  local buffer_multiplier = buffer_page.index
  if z == 1 then
    if n == 1 then
    else
        current_value = params:get(param_prefix .. "_buffer_" .. n - 1  .. "_record")
        print("current buffer " .. n - 1 .. " record value:" .. current_value)
        params:set(param_prefix .. "_buffer_" .. n - 1 .. "_record", 1 ~ current_value, false)
    end
  end
end

function enc(n, d)
  if n == 1 then
    buffer_page:set_index_delta(d, false)
  end
  redraw()
end
