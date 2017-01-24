display.setDefault('background', 1, 0 , 0  )
local widget = require('widget')
local dropdown = require('dropdown')
local screen = require('screen')

local myDropdown
local myDropdown2

local dropdownOptions = {
  {
    title     = 'Home (The 1st Menu)',
    action    = function() 
      native.showAlert('You are Home', 'This is just a placeholder', {'Ok'})
    end 
  },
  {
    rightIcon = display.newImageRect('rightIcon.png', 32, 32),
    title     = 'Testing a menu',
    action    = function() 
      --native.showAlert('Dropdown', 'Dropdown', {'Ok'})
      myDropdown2:toggle()
    end 
  },
  {
    leftIcon  = display.newImageRect('star.png', 32, 32),
    rightIcon = display.newImageRect('rightIcon.png', 32, 32),
    title     = 'We can have icons too',
    action    = function() 
      native.showAlert('Star', 'This is just a placeholder', {'Ok'})
    end 
  },
}

local dropdownOptions2 = {
  {
    title     = 'Home',
    action    = function() 
            myDropdown:toggle()
    end 
  },
  {
    rightIcon = display.newImageRect('rightIcon.png', 32, 32),
    title     = 'Something for Menu2',
    action    = function() 
      native.showAlert('Some action', 'This could be another menu or a function', {'Ok'})
    end 
  },
  {
    leftIcon  = display.newImageRect('star.png', 32, 32),
    rightIcon = display.newImageRect('star.png', 32, 32),
    title     = 'We can have icons too',
    action    = function() 
      native.showAlert('Star Star', 'This is just a placeholder', {'Ok'})
    end 
  },
}


local button = widget.newButton{
  width       = 32,
  height      = 32,
  defaultFile = 'arrow.png',
  overFile    = 'arrow.png',
  onEvent     = function( event )
    local target = event.target
    local phase  = event.phase
    if phase == 'began' then
      target.alpha = .5
    else
      target.alpha = 1
      if phase ==  'ended' then
        myDropdown:toggle()
      end
    end
  end
}
button.alpha = .5

myDropdown     = dropdown.new{
  x            = screen.rightSide - 20,
  y            = screen.topSide + 100,
  toggleButton = button,
  width        = 280,
  marginTop    = 12,
  padding      = 20,
  options      = dropdownOptions
}

myDropdown2     = dropdown.new{
  x            = screen.rightSide - 20,
  y            = screen.topSide + 100,
  toggleButton = button,
  width        = 280,
  marginTop    = 12,
  padding      = 20,
  options      = dropdownOptions2
}