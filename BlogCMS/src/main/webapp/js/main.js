/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//$('a[rel=popover]').popover({
//    html: 'true',
//placement: 'bottom'
//});

// $('.popover-markup>.trigger').popover({
//     html: true,
//     title: function () {
//         return $(this).parent().find('.head').html();
//     },
//     content: function () {
//         return $(this).parent().find('.content').html();
//     }
// });


// // Tagging Example//

// const container = document.getElementsByClassName("taggable-container")[0];
// console.log(container)
// const tags = container.getElementsByTagName("ul")[0];
// const input = container.getElementsByTagName("input")[0];

// // Token seperators
// const keys = ["Enter", ","];

// const interval = 150;

// // Remove tag
// tags.addEventListener("click", removeTag);

// // Add tag
// input.addEventListener("keydown", (e) => {
// 	// Check to see if the key that was pressed is a valid token seperator
// 	// and we have some text to use
// 	if ( keys.includes(e.key) && input.value.length ) {
// 		// Don't enter the key into the input
// 		if ( e.key !== "Enter" ) {
// 			e.preventDefault();
// 		}

// 		// Create the tag
// 		addTag(input.value);
// 	}
// });

// function addTag(text) {
// 	let tag = document.createElement("li");
// 	let t = `<div class="taggable-text">${text}</div>
// 					<button type="button" class="taggable-remove"></button>`;

// 	let pos = {
// 		el: input,
// 		position: input.getBoundingClientRect()
// 	};

// 	tag.className = "taggable-tag adding";
// 	tag.innerHTML = t;

// 	// Append the tag to the DOM
// 	tags.appendChild(tag);

// 	// Clear the input element
// 	input.value = "";

// 	// Check for wrapping
// 	tags.classList.toggle("taggable-wrapped", isWrapped());

// 	// Animate the input element's position
// 	animate(pos);

// 	setTimeout(function() {
// 		tag.classList.remove("adding");
// 	}, 400);	
// }

// let data = [];

// function removeTag(e) {
// 	if ( e.target.classList.contains("taggable-remove") ) {
// 		let tag = e.target.parentNode;
// 		let index = [].slice.call(tags.children).indexOf(tag);

// 		let pos = {
// 			el: input,
// 			position: input.getBoundingClientRect()
// 		};

// 		tag.classList.add("deleting");

// 		[].slice.call(tags.children).forEach(function(tag, i) {
// 			// Only animate the tags proceeding the deleted tag
// 			if ( i >= index ) {
// 				data.push({
// 					el: tag,
// 					position: tag.getBoundingClientRect()
// 				});
// 			}
// 		});

// 		// Remove the tag from the DOM
// 		tags.removeChild(tag);

// 		// Check for wrapping
// 		tags.classList.toggle("taggable-wrapped", isWrapped());

// 		// Focus back on the input element
// 		input.focus();

// 		// Animte the input element
// 		animate(pos);

// 		// Animate the tags affected by the change in the DOM
// 		// when the tag is removed
// 		data.forEach(function(obj, i) {
// 			animate(obj);
// 		});

// 		// Reset
// 		data = [];
// 	}
// }

// // Detect tag wrapping
// function isWrapped() {
// 	if ( tags.childElementCount ) {
// 		let h = tags.firstElementChild.offsetTop, wrapped = false;
// 		for ( let i = 0; i < tags.childElementCount; i++ ) {
// 			// node is lower down that it's preceeding siblings
// 			// so it's been wrapped
// 			if ( tags.children[i].offsetTop > h ) {
// 				wrapped = true;
// 				break;
// 			}
// 		}
// 		return wrapped;
// 	}
// }

// // Animate an element's change in position
// // caused by a change in the DOM order
// function animate(obj) {
// 	let css = obj.el.style;

// 	// Get the node's positon AFTER the change
// 	let r = obj.el.getBoundingClientRect();

// 	// Calculate the difference in position
// 	let x = obj.position.left - r.left;
// 	let y = obj.position.top - r.top;

// 	// Move the node to it's original position before the DOM change
// 	css.transform = `translate3d(${x}px, ${y}px, 0px)`;

// 	// Trigger a repaint so the next bit works
// 	obj.el.offsetHeight;

// 	// Reset the transform, but add a transition so it's smooth
// 	css.transform = `translate3d(0px, 0px, 0px)`;
// 	css.transition = `transform ${interval}ms`;

// 	// Reset the style
// 	setTimeout(function() {
// 		css.transform = ``;
// 		css.transition = ``;
// 	}, interval);
// }
//======================
//STYLE
//==================

$('.carousel').carousel({
  interval: 200,
  pause: "false",
  pauseOnHover: "false",
  wrap: "true"
});








$('#addCat-btn').click(function (event) {
performAjaxCall('category', '', 'POST');
});

$('#updateCat-btn').click(function (event) {
performAjaxCall('category', '', 'PUT');
});

function performAjaxCall(endpoint, extraParameter, ajaxType) {
    var returnData;

    $.ajax({
        async: false,
        type: ajaxType,
        url: `http://localhost:8080/BlogCMS/${endpoint}/${extraParameter}`,
        data: JSON.stringify({
            
                categoryName: $('#categoryName').val()
            }),
        
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        dataType: 'json',
        success: function (data, status) {
            console.log(data);
            returnData = data;
        },
        error: function () {
            console.log("travon");

            returnData = null;
        }
    });
    return returnData;
}

// Travz Users Code
function toggleItem(item) {

	var summary = $(item).find('.itemBrief');
	var buttons = $(item).find('.itemOptions');

	if ($(item).hasClass('toggled')) {
		//$(item).removeClass('toggled');
	} else {
		$(item).addClass('toggled');
	}

	summary.each((index, element) => {
		$(element).addClass('toggled');
	})

	buttons.each((index, element) => {
		$(element).addClass('toggled');
	})
}

function populateModal(type, secondary) {
	
	var label = $("#generalModalLabel");
	var body = $("#generalModalBody");
	var footer = $("#generalModalFooter");
	label.empty();
	body.empty();
	footer.empty();

	if (type == 'notifications') {
		label.html("Filter Notifications")
		body.html(`<h5> Filter for: </h5>
		<div style="text-align: left">
		<div class="checkbox">
		<label><input type="checkbox" value="users">Users</label>
		</div>
		<div class="checkbox">
			<label><input type="checkbox" value="posts">Posts</label>
		</div>
		<div class="checkbox">
		<label><input type="checkbox" value="categories">Categories</label>
		</div>
		<div class="checkbox">
		<label><input type="checkbox" value="tags">Tags</label>
		</div>
		</div>
	  `);
	  footer.html(` 
	  <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
	  <a href="http://localhost:8080/BlogCMS/userDashboard?view=notifications&filters=users" class="btn btn-primary"> Filter </a>
	  `);
	}

	if (type == 'notifications_view') {
		// Rest controller api call, get particular dto , GET
		label.html("View Category")
		body.html(`<h5> Category Details: </h5>
		<div style="text-align: center">
			 <p class="mine"> Created by: Username </p>
			 <input type="text" name="categoryName" value="The name of the category" />
			 <a href="#" class="btn btn-success"> Edit Category </a> 
		</div>
	  `);
	  footer.html(` 
	  <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
	  `);
	}

	if (type == 'notifications_approve') {
		// Rest controller api call , POST
		label.html("Category Approval")
		body.html(`<h4>Successfully Approved Category</h4>`);
	  footer.html(` 
	  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	  `);
	}

	if (type == 'notifications_request_edit') {
		// Rest controller api call , POST
		label.html("Category Modification Request")
		body.html(`<h4>That category needs be modified for approval</h4>
		<div style="text-align: left">
		<h6>Choose a reason for </h6>
		<div class="checkbox">
		<label><input type="checkbox" value="grammar">Grammar Errors</label>
		</div>
		<div class="checkbox">
			<label><input type="checkbox" value="irrelevant">Irrelevant Category</label>
		</div>
		<div class="checkbox">
		<label><input type="checkbox" value="misc">I just, don't like you bro (Default) </label>
		</div>
		</div>
		`);
	  footer.html(` 
	  <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
	  <a href="#" class="btn btn-success"> Submit Edit Request</a> 
	  `);
	}

	if (type == 'notifications_vanquish') {
		// Rest controller api call , POST
		label.html("Category Deleted Forever")
		body.html(`<h4>That category is being deleted</h4>
		<div style="text-align: left">
		<h6>Choose a reason for this change: </h6>
		<div class="checkbox">
		<label><input type="checkbox" value="nonesensical">Nonsensical category </label>
		</div>
		<div class="checkbox">
			<label><input type="checkbox" value="duplicate">Duplicate</label>
		</div>
		<div class="checkbox">
		<label><input type="checkbox" value="misc">I just, don't like you bro (Default) </label>
		</div>
		</div>
		`);
	  footer.html(` 
	  <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
	  <a href="#" class="btn btn-success"> Finalize Delete</a> 
	  `);
	}

	if (type == 'users_pending') {
		// get my pending notifications and edit requests
		label.html("My Users")
		body.html(`<h5>These are your pending users</h5>
		<div style="text-align: left">
		<h6>Edit Requests: </h6>
		You have 2 users that need approval <br>
		<a href="#"> John  </a> <a href="#"> Alan  </a>
		<hr>
		<h6>Approval Requests: </h6>
		You have 4 users that need approval <br>
		<a href="#"> Mary  </a> <a href="#"> Jesus  </a>
		</div>
		`);
	  footer.html(` 
	  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	  `);
	}

	if (type == 'users_settings') {
		// get my pending notifications and edit requests
		label.html("My Settings")
		body.html(`<h5>Change your personalized settings here</h5>
		<div style="text-align: left"> 
		<h6>1. Change Password: </h6>
		<label for="newPassword"> 
		<input type="password" name="newPassword" id="newPassword" value="mypassword" placeholder="New Password" />
		<a href="#" class="btn btn-primary" style="margin-bottom: 5px;"> Submit new password </a>  
		<hr>
		<h6>2. Change Username: </h6>
		<label for="newUsername"> 
		<input type="text" name="newUsername" id="newUsername" value="my username" placeholder="New Username" />
		<a href="#" class="btn btn-primary"> Submit new password </a> 
		</div>
		`);
	  footer.html(` 
	  <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
	  `);
	}

	if (type == 'users_stats') {
		label.html("User Statistics");
		body.html(`<h5>Information</h5>
		<div style="text-align: left"> 
		 	<p class="mine"> Top Post : All about greece, 50 likes <a href="#"> See all posts >>  </a> </p>
		 	<p class="mine"> Top Category: All about greece, 50 likes <a href="#"> See all posts >>  </a> </p>
		</div>
		`);
	  footer.html(` 
	  <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
	  `);
	}

	if (type == 'users_ban') {
		label.html("User Ban Confirmation");
		body.html(`<h5>Are you sure you want to ban that user?</h5>
		<div style="text-align: left"> 
		<h6>Choose a reason for the ban request</h6>
		<div class="checkbox">
		<label><input type="checkbox" value="disrespect">Disrespectful User</label>
		</div>
		<div class="checkbox">
			<label><input type="checkbox" value="fired">User don't work here anymore</label>
		</div>
		<div class="checkbox">
		<label><input type="checkbox" value="misc">I just, don't like you bro (Default) </label>
		</div>
		</div>
		`);
	  footer.html(` 
	  <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
	  <a href="#" class="btn btn-success"> Finalize Ban</a> 
	  `);
	}

	if (type == 'users_delete') {
		label.html("User Delete Confirmation");
		body.html(`<h5>Are you sure you want to delete that user?</h5>
		<div style="text-align: left"> 
		<h6>Choose a reason for the ban request</h6>
		<div class="checkbox">
		<label><input type="checkbox" value="disrespect">Disrespectful User</label>
		</div>
		<div class="checkbox">
			<label><input type="checkbox" value="fired">User don't work here anymore</label>
		</div>
		<div class="checkbox">
		<label><input type="checkbox" value="misc">I just, don't like you bro (Default) </label>
		</div>
		</div>
		`);
	  footer.html(` 
	  <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
	  <a href="#" class="btn btn-success"> Finalize delete</a> 
	  `);
	}

 



}