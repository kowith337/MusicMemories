-- script to report on all the spectra in a project
-- currently it lists the following information for each spectrum
-- ID, SpectrumName, Dim, RF(dim1)  SW[ppm](dim1)
--                   Dim, RF(dim2)  SW[ppm](dim2)
--   etc...
-- it could easily to elaborated to report on SpectrumType, Nucleus, Calibrations etc...

-- F.Damberger Feb 16 2007

-- Version 1: Feb. 16 2007 : initial version only reported one selected spectrum in one project
-- Version 2: Feb.  9 2009 : added loop and formatting to report on all spectra in selected project



-- ----------------------------------------------------------------------


-- create array for script variables
t = {}


-- ----------------------------------------------------------------------

-- =================== Define Functions =================================


function TableSize( Table )
	local Size = 0
	for IdNum,Entry in pairs( Table ) do
		Size = Size + 1
	end -- for
	return Size
end -- function TableSize


function AtomNameFromResType( Label, ResType )  -- added in ver.7
	-- purpose: return true if label occurs in ResType
	local result = nil
	for AtomName,Atom in pairs( ResType:getAtoms() ) do
		if Label == AtomName then
			result = true
		end
	end -- for all atoms in ResType
	return result
end -- function AtomNameFromResType

function CreateProjectNamesComboBox( SelectedProjectName )
	ProjectNamesComboBox = gui.createComboBox( t.frm )
	SelectedItemIndex = nil
	for Id,Project in pairs( cara:getProjects() ) do
		ItemIndex = ProjectNamesComboBox:addItem( Project:getName() )
		ProjectNamesComboBox:setCurrentItem( ItemIndex )
		if SelectedProjectName == ProjectNamesComboBox:getCurrentText() then
			SelectedItemIndex = ItemIndex
		end
	end -- for all projects
	if SelectedItemIndex then -- set to previous choice if it exists
		ProjectNamesComboBox:setCurrentItem( SelectedItemIndex )
	end
	return ProjectNamesComboBox
end -- function LoadProjectNamesToComboBox

function CreateSpectraNamesComboBox( Spectra, SelectedSpectrumName )
	SpectraNamesComboBox = gui.createComboBox( t.frm )
	SpectraNamesComboBox:clear()
	for SpectrumId,Spectrum in pairs( Spectra ) do
		ItemIndex = SpectraNamesComboBox:addItem( Spectrum:getName() )
		SpectraNamesComboBox:setCurrentItem( ItemIndex )
		if SelectedSpectrumName == SpectraNamesComboBox:getCurrentText() then
			SelectedItemIndex = ItemIndex
		end 
	end -- for all Spectra
	if SelectedItemIndex then -- set to previous choice if it exists
		SpectraNamesComboBox:setCurrentItem( SelectedItemIndex )
	end
	return SpectraNamesComboBox
end -- function CreateComboboxFromTable


function GetSpectrum( Project, SpectrumName )
	for Id,Spec in pairs( Project:getSpectra() ) do
		if SpectrumName == Spec:getName() then return Spec end
	end -- for all Spectra
end -- function GetSpectrum

--===================END OF FUNCTION DEFINITIONS ========================


-- ================== SOME PARAMETER DEFINITIONS ========================



-- ============Set up menu window for user preferences===================

--0. Check whether there are any projects available
ProjectsTable = cara:getProjects()

if TableSize( ProjectsTable ) == 0 then error("No projects found in repository") end


--1. Create main menu window

v = gui.createMainWindow()
v:setCaption( "Report Spectrum Parameters" )
t.frm = gui.createGrid( v, 2, false )
v:setCentralWidget( t.frm )
v:show()
t.frm:show()

-- Project Selector
t.ProjectListLabel = gui.createLabel( t.frm, "Select Project" )
t.ProjectListCB = CreateProjectNamesComboBox( ProjectName )


-- Display ProjectList Combobox
t.ProjectListLabel:show()
t.ProjectListCB:show()

print( t.ProjectListCB:getCurrentText() )
t.Project = cara:getProject( t.ProjectListCB:getCurrentText() )

-- comment in the items below to include a spectrum selector

-- Spectra Selector
--t.SpectraListLabel = gui.createLabel( t.frm, "Select Spectrum" )
--t.SpectraListCB = CreateSpectraNamesComboBox( t.Project:getSpectra(), SpectrumName )

-- Display SpectrumList Combobox
--t.SpectraListLabel:show()
--t.SpectraListCB:show()

--9. OK and Cancel Buttons

t.okbutton = gui.createPushButton(t.frm, "OK" )
t.cancelbutton = gui.createPushButton( t.frm, "Cancel" )

t.okbutton:show()
t.cancelbutton:show()


-- ============Callbacks for menu window ===================

-- Define Callbacks for the buttons

-- comment in the section below to allow the SpectrumListCB to be updated
-- when the user changes the project selection

--[[
t.ProjectListCB:setCallback( gui.event.Activated,
	function (self)
		print("arrived at callback for project list")
		t.Project = cara:getProject( t.ProjectListCB:getCurrentText() )
		t.SpectraListCB:clear()
		Spectra = t.Project:getSpectra()
		-- refill the Spectra list of the combobox
		--print("Project="..t.Project:getName())
		for SpectrumId,Spectrum in pairs( Spectra ) do
			ItemIndex = SpectraNamesComboBox:addItem( Spectrum:getName() )
			--print(SpectrumId,Spectrum:getName())
			SpectraNamesComboBox:setCurrentItem( ItemIndex )
			if SelectedSpectrumName == SpectraNamesComboBox:getCurrentText() then
				SelectedItemIndex = ItemIndex
			end 
		end -- for all Spectra
		if SelectedItemIndex then -- set to previous choice if it exists
			SpectraNamesComboBox:setCurrentItem( SelectedItemIndex )
		end
		
		t.SpectraListCB = CreateSpectraNamesComboBox( t.Project:getSpectra(), SpectrumName )
	end
)
]]

-- cancel button Callback
t.cancelbutton:setCallback( gui.event.Clicked,
	function (self)
		v:close()
	end
) -- end cancel button Callback

-- OK button Callback
t.okbutton:setCallback( gui.event.Clicked,
	function (self)
-- =============== Determine User Preferences ===========================

		t.Project = cara:getProject( t.ProjectListCB:getCurrentText() )
		ProjectName = t.Project:getName()
		print("Project name is "..ProjectName)
		-- comment in 2 lines below to allow single spectra to be selected
		--t.SpectrumName = t.SpectraListCB:getCurrentText()
		--t.Spectrum = GetSpectrum( t.Project, t.SpectrumName )
		emptystring=" "
		print("   ID   SpectrumName   Dim   RF[MHz]   SW[ppm]")
		for SpecId,Spectrum in pairs( t.Project:getSpectra()) do
			ID=string.format("%5d", SpecId )
			SpectrumName = string.format("%15s", Spectrum:getName() )
			NumDim=Spectrum:getDimCount()
			for i=1,NumDim do 
				Dim=string.format("%6d", i )
				RF=string.format( "%10.2f", Spectrum:getRfFreq(i) )
				--RF=string.format( "%10s", RF )
				HighPpm,LowPpm=Spectrum:getPpmRange(i)
				SWppm=string.format("%10.2f", HighPpm-LowPpm )
				if i~=1 then
					SpectrumName = string.format("%15s", emptystring )
					ID=string.format("%5s", emptystring )
				end -- if not first dimension
				print( ID..SpectrumName..Dim..RF..SWppm)
				
			end -- for all spectrum dimensions
		end -- for all spectra in project
		v:close()
	end -- function ok callback
) -- end OK button Callback

-- End of script FD.

