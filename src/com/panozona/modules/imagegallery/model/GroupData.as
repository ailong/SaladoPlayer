/*
Copyright 2012 Marek Standio.

This file is part of SaladoPlayer.

SaladoPlayer is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published
by the Free Software Foundation, either version 3 of the License,
or (at your option) any later version.

SaladoPlayer is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty
of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with SaladoPlayer. If not, see <http://www.gnu.org/licenses/>.
*/
package com.panozona.modules.imagegallery.model {
	
	import com.panozona.modules.imagegallery.model.structure.Group;
	import com.panozona.modules.imagegallery.model.structure.Groups;
	import com.panozona.modules.imagegallery.events.GroupEvent;
	import flash.events.EventDispatcher;
	
	public class GroupData extends EventDispatcher {
		
		public const groups:Groups = new Groups();
		private var _currentGroupId:String = null;
		
		public function getGroupById(groupId:String):Group {
			for each(var group:Group in groups.getChildrenOfGivenClass(Group)) {
				if (group.id == groupId) return group;
			}
			return null;
		}
		
		public function get currentGroupId():String {return _currentGroupId;}
		public function set currentGroupId(value:String):void {
			if (value == null || value == _currentGroupId) return;
			_currentGroupId = value;
			dispatchEvent(new GroupEvent(GroupEvent.CHANGED_CURRENT_GROUP_ID));
		}
	}
}