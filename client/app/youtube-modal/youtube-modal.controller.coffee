( ->
	angular
		.module 'slidiApp'
		.controller 'YoutubeModalCtrl', ($scope, $modalInstance) ->
		  $scope.link = ''
		  $scope.ok = () ->
		  	$modalInstance.close $scope.link
		  $scope.cancel = () ->
		    $modalInstance.dismiss 'cancel'
)()