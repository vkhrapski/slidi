( ->
	angular
		.module 'slidiApp'
		.controller 'TextModalCtrl', ($scope, $modalInstance) ->
		  $scope.text = ''
		  $scope.ok = () ->
		  	$modalInstance.close $scope.text
		  $scope.cancel = () ->
		    $modalInstance.dismiss 'cancel'
)()