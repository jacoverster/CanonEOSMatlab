classdef PhotoSession
    properties
        ph % photo listener handle
        lv % live view listener handle
        Photo
    end
    methods
        function obj = PhotoSession(Camera)
            obj.ph = addlistener(Camera, 'PhotoCaptured', @PhotoSession.PhotoCapturedCallback);
        end
    end
    methods (Static)
        function PhotoCapturedCallback(Camera,Photo)
            %FullPath = [pwd '\Photos\' char(Photo.FileName)];
              FullPath = [pwd char(Photo.FileName)];
            Camera.TransferFile(Photo.Handle, FullPath);
            figure()
            FullPath
            imshow(FullPath)
            %winopen(FullPath);
            assignin('caller', 'LastPhoto', Photo);
        end
    end
end

